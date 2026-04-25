---
name: security-defaults
description: Apply secure defaults when writing code that handles data, credentials, or user input. Use when building APIs, handling authentication, processing user data, or configuring infrastructure to avoid common vulnerabilities by default.
license: MIT
---

# Security Defaults

Secure code isn't a separate concern — it's a quality bar. These are the defaults, not the exceptions.

**Tradeoff:** Some defaults add a small amount of friction. That friction is the point.

## 1. Validate at the Boundary

**Trust nothing that crosses a trust boundary.**

- Validate all input at the point it enters your system: HTTP requests, file uploads, CLI arguments, environment variables, database reads from external systems.
- Reject early — don't pass unvalidated data deep into the call stack.
- Don't validate the same input twice in different ways. Pick one place.
- Internal function calls between code you own don't need defensive validation — that's noise, not security.

## 2. No Secrets in Code

**Credentials don't belong in source files, ever.**

- No API keys, passwords, tokens, or private keys in code or config files checked into version control.
- Use environment variables or a secrets manager. Reference them by name, never inline the value.
- If you see a secret in a diff, treat it as compromised immediately — rotation, not just deletion.
- `.env` files are for local development only. They must be in `.gitignore`.

## 3. Least Privilege by Default

**Request only the access you need. Scope it as tightly as possible.**

- Database credentials should only have the permissions the application actually uses (SELECT for read-only services, no DROP or CREATE for application accounts).
- API tokens should be scoped to the minimum required endpoints.
- File operations should use the least permissive mode that works.
- When in doubt, start with less and expand rather than start with more and restrict.

## 4. Output Encoding Matches the Sink

**Encode for where the data is going, not where it came from.**

- Data going into HTML → HTML-encode it.
- Data going into a SQL query → use parameterized queries, never string concatenation.
- Data going into a shell command → use argument arrays, never string interpolation.
- Data going into a URL → URL-encode it.

The same string needs different treatment in different sinks. Don't pre-encode at input time — encode at the point of use.
