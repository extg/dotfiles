# SSH Key Generation

## Generate a New Key

Generate a new Ed25519 SSH key (recommended):

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

> Ed25519 is preferred over RSA for better security with smaller key sizes

## View Key Fingerprint

To view the fingerprint of an SSH key:

```sh
ssh-keygen -lf ./id_rsa -E md5
``` 

## Reference
- [GitHub Docs: Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 
