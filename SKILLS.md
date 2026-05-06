# Agent Skill: Poster Engineering

This document provides specialized instructions for AI agents (LLMs) to interact with the PosterMaker repository.

## Capabilities
- Generate new high-visual cheatsheets from user requirements.
- Modify existing layouts using Typst-native spanning logic.
- Automate documentation updates via the Bash bridge.

## Operational Rules
1. **Never Hardcode Content**: All text must live in a `.json` file inside the `data/` directory.
2. **Schema Compliance**: Follow the `DESIGN.md` tokens and the `main.typ` schema requirements.
3. **Validation**: After any change, run `typst compile main.typ` to verify syntax.
4. **Socratic Protocol**: Follow the 3-phase sequence in `llms.txt`. Ask exactly **one question** at a time. Suggest themes from `assets/awesome-design-md/design-md/`.
5. **Separation of Concerns**:
   - **Allowed to Edit**: `DESIGN.md`, `README.md`, `data/*.json`.
   - **Forbidden to Edit**: `SPEC.md`, `SKILLS.md` (these are the system's "Factory Settings").

## Prompting Patterns
- **User Request**: "Add a troubleshooting section."
- **Agent Action**: Create a new object in the JSON with `color: "#ef4444"` and descriptive content.
