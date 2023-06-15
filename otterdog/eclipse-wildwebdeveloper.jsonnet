local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-wildwebdeveloper') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_repo_visibility: true,
    members_can_create_teams: true,
    members_can_delete_repositories: true,
    name: "Eclipse WildWebDeveloper",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    security_managers: [],
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('wildwebdeveloper') {
      allow_merge_commit: false,
      default_branch: "master",
      description: "Simple and productive Web Development Tools in the Eclipse IDE",
      homepage: "https://projects.eclipse.org/projects/tools.wildwebdeveloper",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "hacktoberfest"
      ],
      web_commit_signoff_required: false,
    },
  ],
}
