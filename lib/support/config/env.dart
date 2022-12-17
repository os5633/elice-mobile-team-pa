const String buildEnv = String.fromEnvironment('build.env');

const devConfig = {
  'baseUrl': 'https://api-rest.elice.io/org',
};

const stageConfig = {
  'baseUrl': 'https://api-rest.elice.io/org',
};

const productionConfig = {
  'baseUrl': 'https://api-rest.elice.io/org',
};

const environment = buildEnv == 'production'
    ? productionConfig
    : buildEnv == 'dev'
        ? devConfig
        : buildEnv == 'stage'
            ? stageConfig
            : productionConfig;
