# lazyscript tool reference

This reference explains the modern "Swiss knife" tools added around the safe-audit workflow. Use them only on systems, repositories, domains, and networks you own or have explicit permission to assess.

## Safe audit workflows

| Workflow | Tools used | What it gives you |
|---|---|---|
| Passive domain recon | Amass, Subfinder | Subdomains and related public assets without active exploitation. |
| Web fingerprint | WhatWeb, httpx | Status codes, page titles, server hints, and technology fingerprints. |
| TLS/SSL audit | sslscan, testssl.sh | Certificate, protocol, and cipher findings for HTTPS services. |
| Repo secrets + code scan | Gitleaks, Semgrep | Accidentally committed secrets plus static code security findings. |
| SBOM + dependency risk | Syft, Grype, Trivy | Package inventory and known vulnerability findings for filesystems/images. |
| Web crawl + DNS probe | Katana, dnsx | URLs found by crawling and DNS records/resolution checks. |
| Local Linux audit | Lynis | Hardening suggestions for the current Linux system. |
| Binary hardening | checksec | PIE, RELRO, NX, canary, and other binary protection checks. |

Reports are saved under `$LPATH/reports`.

## Modern tool explanations

| Tool | Category | What it does | Typical safe command |
|---|---|---|---|
| Nuclei | Web vulnerability scanning | Runs template-based checks against authorized targets. | `nuclei -u https://example.com` |
| ffuf | Web discovery | Finds directories, virtual hosts, or parameters using wordlists. | `ffuf -w words.txt -u https://example.com/FUZZ` |
| Feroxbuster | Web discovery | Recursive content discovery for authorized web apps. | `feroxbuster -u https://example.com -w words.txt` |
| WhatWeb | Web fingerprinting | Identifies web technologies and server hints. | `whatweb https://example.com` |
| httpx | Web probing | Checks live hosts and returns status/title/technology data. | `httpx -l hosts.txt -status-code -title -tech-detect` |
| Katana | Web crawling | Crawls authorized web targets and outputs discovered URLs. | `katana -u https://example.com -silent` |
| Gowitness | Web screenshots | Captures screenshots for web recon reports. | `gowitness scan single --url https://example.com` |
| Subfinder | OSINT/recon | Passive subdomain enumeration. | `subfinder -d example.com` |
| Amass | OSINT/recon | Deeper asset and subdomain discovery. | `amass enum -passive -d example.com` |
| dnsx | DNS probing | Resolves and checks DNS records from host lists. | `dnsx -l hosts.txt -a -resp` |
| Naabu | Port discovery | Fast port discovery for authorized hosts. | `naabu -host example.com` |
| RustScan | Port discovery | Fast port scan launcher. | `rustscan -a example.com` |
| sslscan | TLS audit | Quick TLS certificate/protocol/cipher review. | `sslscan example.com:443` |
| testssl.sh | TLS audit | Deeper HTTPS/TLS configuration assessment. | `testssl.sh example.com` |
| Gitleaks | Code/repo audit | Finds secrets, API keys, and tokens in source trees. | `gitleaks detect --source .` |
| Semgrep | Code/repo audit | Static analysis for code security and bug patterns. | `semgrep --config auto .` |
| Trivy | Dependency/container audit | Scans filesystems, repos, and container images for CVEs. | `trivy fs .` |
| Syft | SBOM | Generates a package inventory/SBOM. | `syft . -o table` |
| Grype | Dependency/container audit | Finds vulnerabilities in SBOMs, filesystems, and images. | `grype .` |
| Lynis | Local system audit | Checks Linux hardening and configuration. | `lynis audit system` |
| checksec | Binary audit | Shows binary exploit-mitigation flags. | `checksec --file=/bin/ls` |

## Organization notes

- Prefer `safeaudit` for report-oriented checks.
- Prefer `doctor` when you want to know what is missing.
- Keep high-risk or legacy tools separate from modern defensive workflows.
- Do not scan third-party targets without permission.
