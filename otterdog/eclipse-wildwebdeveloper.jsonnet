local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-wildwebdeveloper') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse WildWebDeveloper",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('wildwebdeveloper') {
      allow_merge_commit: false,
      default_branch: "master",
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
          value: "********",
        },
      ],
    },
  ],
}
