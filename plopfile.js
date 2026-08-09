export default function (plop) {

  plop.setHelper('copyrightYear', function () {
    return new Date().getFullYear();
  });

  plop.setHelper('initVersion', function () {
    return '0.9.0-pre.0';
  });

  plop.setHelper('underline', function (char, length) {
    return char.repeat(length);
  });

  plop.setHelper('titlecase', function (text) {
    return text.charAt(0).toUpperCase() + text.slice(1);
  });

  plop.setHelper('javascriptPkgName', function (text) {
    return text.toLowerCase().replace(/ /g, '-');
  });

  plop.setHelper('pythonPkgName', function (text) {
    return text.toLowerCase().replace(/ /g, '');
  });

  plop.setHelper('rubyPkgName', function (text) {
    return text.toLowerCase().replace(/ /g, '_');
  });

  const prompts = [
    {
      type: 'input',
      name: 'project_id',
      message: 'Project ID'
    },
    {
      type: 'input',
      name: 'project_name',
      message: 'Project Name'
    },
    {
      type: 'input',
      name: 'project_desc',
      message: 'Project Description '
    },
    {
      type: 'input',
      name: 'author_name',
      message: 'Author Name'
    },
    {
      type: 'input',
      name: 'author_email',
      message: 'Author Email'
    },
    {
      type: 'input',
      name: 'author_url',
      message: 'Author URL'
    },
    {
      type: 'input',
      name: 'github_id',
      message: 'GitHub ID'
    },
    {
      type: 'input',
      name: 'github_repo',
      message: 'GitHub Repository'
    },
    {
      type: 'input',
      name: 'github_token_prefix',
      message: 'GitHub Actions token prefix'
    }
  ];

  plop.setGenerator('oag-file-spec', {
      description: 'OAG File Spec Plop',
      prompts: prompts,
      actions: [
        {
          type: 'addMany',
          destination: 'stage',
          templateFiles: [
            'templates/oag-file-spec/.*/*/*/*',
            'templates/oag-file-spec/.*/*/*',
            'templates/oag-file-spec/.*/*',
            'templates/oag-file-spec/**/.*',
            'templates/oag-file-spec/**/*'
          ]
        }
      ]
  });

  plop.setGenerator('oag-file-spec-partials', {
    description: 'OAG File Spec partials template',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage/oag-file-spec-partials',
        templateFiles: [
          'templates/oag-file-spec-partials/*'
        ],
        base: 'templates/oag-file-spec-partials'
      }
    ]
  });

  plop.setGenerator('oag-url-spec', {
    description: 'OAG URL Spec Plop',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage',
        templateFiles: [
          'templates/oag-url-spec/.*/*/*/*',
          'templates/oag-url-spec/.*/*/*',
          'templates/oag-url-spec/.*/*',
          'templates/oag-url-spec/**/.*',
          'templates/oag-url-spec/**/*'
        ]
      }
    ]
  });

  plop.setGenerator('oag-url-spec-partials', {
    description: 'OAG URL Spec partials template',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage/oag-url-spec-partials',
        templateFiles: [
          'templates/oag-url-spec-partials/*'
        ],
        base: 'templates/oag-url-spec-partials'
      }
    ]
  });
};