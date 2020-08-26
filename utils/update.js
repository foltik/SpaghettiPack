#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const got = require('got');

const mod = process.argv[2];

if (!mod) {
    console.log('Usage: update.js /path/to/mod');
    process.exit(1);
}

const info = path.join(mod, 'info.json');
if (!fs.existsSync(info)) {
    console.log('No info.json found in mod directory!');
    process.exit(1);
}

const config = JSON.parse(fs.readFileSync(info, 'utf8'));

let mods = config.dependencies.map(d => {
    const [name, version] = d.split(' >= ');
    return {name, version};
});

(async () => {
    console.log('Retrieving latest mod versions...');
    console.log();

    await Promise.all(mods.filter(m => m.name != 'base').map(async m => {
        try {
            const r = await got(`https://mods.factorio.com/api/mods/${m.name}`);
            const body = JSON.parse(r.body);

            const releases = body.releases;
            const latest = releases[releases.length - 1].version;

            m.latest = latest;
        } catch (e) {
            console.log(`Error retrieving versions for ${m.name}:`);
            console.log(e);
        }
    }));

    const updated = mods.filter(m => m.latest && m.latest != m.version);

    if (updated.length) {
        console.log(`Found ${updated.length} mods with new versions:`);
        updated.forEach(m => console.log(`${m.name}: ${m.version} -> ${m.latest}`));
        config.dependencies = mods.map(m => `${m.name} >= ${m.latest || m.version}`);
        console.log();

        console.log('Writing new versions to file...');
        console.log();
        fs.writeFileSync(file, JSON.stringify(config, null, 4));

        console.log('Done!');
    } else {
        console.log('All mods are up to date!');
    }
})();
