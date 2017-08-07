let project = new Project('Project caravan');
project.addAssets('Assets/**', { nameBaseDir: 'Assets', destination: '{dir}/{name}', name: '{dir}/{name}' });
project.addSources('Sources');
resolve(project);
