local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('tools.wildwebdeveloper', 'eclipse-wildwebdeveloper') {
  settings+: {
    description: "",
    name: "Eclipse WildWebDeveloper",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('wildwebdeveloper') {
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Simple and productive Web Development Tools in the Eclipse IDE",
      has_discussions: true,
      homepage: "https://projects.eclipse.org/projects/tools.wildwebdeveloper",
      topics+: [
        "hacktoberfest"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
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