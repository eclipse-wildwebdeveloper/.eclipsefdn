// see https://github.com/EclipseFdn/otterdog-defaults/blob/main/otterdog-defaults.libsonnet
local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

// see https://otterdog.readthedocs.io/en/latest/reference/organization/
orgs.newOrg('tools.wildwebdeveloper', 'eclipse-wildwebdeveloper') {
  settings+: {
    description: "",
    name: "Eclipse WildWebDeveloper",
    web_commit_signoff_required: false,
    workflows+: {
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/wildwebdeveloper/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push",
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('wildwebdeveloper') {
      allow_merge_commit: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Simple and productive Web Development Tools in the Eclipse IDE",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://projects.eclipse.org/projects/tools.wildwebdeveloper",
      squash_merge_commit_message: "PR_BODY",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "eclipse",
        "eclipse-plugin",
        "hacktoberfest",
        "java"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('GITLAB_API_TOKEN') {
          value: "pass:bots/tools.wildwebdeveloper/gitlab.eclipse.org/api-token",
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
