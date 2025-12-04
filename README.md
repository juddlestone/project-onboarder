# Project Onboarder


This repository captures my project requirements in a `json` data format, then creates and configures the necessary baseline set of infrastructure for me in a standardized manner. Giving me more time to focus of tinkering, learning and experimenting, and less time configuring identities, authentication, resource groups and permissions.

## What does it deploy?
- Github Repository
- Github Repository Branches (For each environment)
- Github Secrets (For each project, and each environment within the project)
- Azure Resource Group w/ Budget (For each environment)
- User Assigned Managed Identity w/ Workload Identity Federation (For each environment)

<div align="center">
<img src="/static/overview.png" alt="A overview of the solution and what it deploys" width="500">
</div>