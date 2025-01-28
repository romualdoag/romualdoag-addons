# OpenWebUI Addon for Home Assistant

[![Version](https://img.shields.io/badge/version-0.0.1-blue.svg)](https://github.com/open-webui/open-webui/releases)
![Architecture](https://img.shields.io/badge/arch-aarch64%20%7C%20amd64-success)
[![GitHub Repository](https://img.shields.io/badge/Repository-OpenWebUI-success?logo=github)](https://github.com/open-webui/open-webui)

## About

**OpenWebUI** - Get up and running with OpenWebUI and Ollama for large language models. This addon provides a user-friendly web interface for interacting with LLMs through Ollama integration.

## Prerequisites

- Ollama Addon installed and configured
- Minimum 2GB RAM (4GB recommended for complex models)

## Persistent Configuration

```yaml
map:
  - config:rw
```

All configurations and data are stored in `/config` directory. Ensure adequate storage space for:
- User preferences
- Chat history
- Custom settings

## Web Interface Access

[![Open in Home Assistant](https://my.home-assistant.io/badges/brand.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=openwebui)

**Direct Access URL:**
```yaml
http://${slug}:13000
```

## Network Configuration

| Host Port | Container Port | Protocol | Description          |
|-----------|----------------|----------|----------------------|
| 13000     | 3000           | TCP      | Web UI Interface     |

## Technical Details

```yaml
# Base Configuration
image: ghcr.io/open-webui/open-webui:ollama
watchdog: tcp://[HOST]:[PORT:13000]
init: false

# Ingress Settings
ingress: true
ingress_port: 13000
ingress_stream: true
```

## Optimization Tips

1. **Performance:**  
   For better response times, ensure Ollama is running on the same network
2. **Caching:**  
   Browser caching is enabled by default for static assets
3. **Theming:**  
   Customize UI through settings (persisted in `/config`)

## Troubleshooting

❯ **Connection Issues**  
   Verify Ollama service is reachable at `http://ollama:11434`

❯ **Blank Page on Load**  
   Clear browser cache or try incognito mode

## Documentation Links

- [Official Documentation](https://github.com/open-webui/open-webui/wiki)
- [Ollama Integration Guide](https://ollama.com/library)
- [Docker Image Details](https://ghcr.io/open-webui/open-webui)

---

> **Note**: This addon requires Ollama 0.5.7+ for full functionality. Interface auto-updates when new versions are available.