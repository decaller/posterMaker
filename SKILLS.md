# Agent Skill: Poster Engineering

This document provides specialized instructions for AI agents (LLMs) to interact with the PosterMaker repository.

## Capabilities
- Generate new high-visual cheatsheets from user requirements.
- Modify existing layouts using Typst-native spanning logic.
- Automate documentation updates via the Bash bridge.

## Operational Rules
1. **Never Hardcode Content**: All text must live in a `.json` file inside the `data/` directory.
2. **Schema Compliance**:
   - `title`: String (Caps preferred).
   - `color`: Hex code.
   - `span`: Integer (1, 2, or 3).
   - `is_flow`: Boolean (true for sequence diagrams).
   - `steps`: Array of strings (required if `is_flow` is true).
3. **Design System**: Use `section-box` for standard blocks and `level-badge` for recipes.
4. **Validation**: After modifying a JSON or Typst file, always attempt to run `typst compile main.typ` to verify syntax.

## Prompting Patterns
- **User Request**: "Add a troubleshooting section."
- **Agent Action**: Create a new object in the JSON with `color: "#ef4444"` and descriptive content.
