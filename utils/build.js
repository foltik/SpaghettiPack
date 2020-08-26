#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const got = require('got');
const {spawn} = require('child_process');

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

const {name, version} = config;
const out = `${name}_${version}.zip`;

const zip = spawn('zip', ['-r', out, mod]);
zip.on('close', () => {
    console.log(`Created ${out}!`);
});
