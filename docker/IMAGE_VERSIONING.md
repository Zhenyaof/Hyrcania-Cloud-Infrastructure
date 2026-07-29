# Docker Image Versioning

Hyrcania uses semantic versioning for container images.

Format:

MAJOR.MINOR.PATCH

Example:

hyrcania-app:v1.0.0


## Version Strategy

v1.0.0
- Initial Docker application release

v1.1.0
- New features

v1.0.1
- Bug fixes


## Future Workflow

Developer
    |
    |
Docker Build
    |
    |
Tag Image
    |
    |
Azure Container Registry
    |
    |
AKS Deployment