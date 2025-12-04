# Project Onboarder


This repository captures my project requirements in a `json` data format, then creates and configures the necessary baseline set of infrastructure for me in a standardized manner. Giving me more time to focus of tinkering, learning and experimenting, and less time configuring identities, authentication, resource groups and permissions.

## What does it deploy?
- A Github repository, with a branch for each specified environment. Ensuring 'main' is used for any 'PRD' environments.
- Github secrets pertaining to the Client ID, Subscription ID, and Tenant ID. Used to facilitate workload identity federation authentication.
- An Azure Resource Group, with a defined budget configured.
- A user-assigned managed identity. With 'Owner' permissions at it's necessary resource group and 'Storage Blob Data Contributor' on it's specific storage container for state.
- It also configures workload identity federation on the identity. Ensuring I have no credentials to manage and rotate.

<div align="center">
<img src="/static/overview.png" alt="A overview of the solution and what it deploys" width="400">
</div>