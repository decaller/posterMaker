# 📄 llm.txt | 🐙 GitHub Repo | [🔄 LLM Version: e.g., Claude 3.5 Sonnet (Oct 2024)]

## 🧠 AI Co-Pilot Recipe: [Insert Recipe Name, e.g., Full-Stack Auth Pipeline]

**Babysitting Level:** [e.g., HIGH 🔴 / MEDIUM 🟡 / LOW 🟢]
*(Percentage of manual tweaking expected: e.g., 60%)*

---

### ⚠️ The Reality Check (Disclaimer)
AI models are trained on past data and are highly prone to "condong" (biased/outdated) knowledge.
- **Always verify:** Check the official, up-to-date documentation. Boilerplates break.
- **🌀 The Death Loop:** If the AI apologizes twice and gives you the exact same broken code, stop arguing with it. It is hallucinating and stuck in a confusion loop. Open a fresh chat, clear the context, and try a different prompt.

---

### 🗺️ The Big Picture
- **The Global View:** [Brief 1-2 sentence overview of what this recipe achieves in the grand scheme.]
- **🔥 The Motivation:** [e.g., Auth is notoriously frustrating. Pushing through this recipe means you'll never have to manually wire up JWT tokens from scratch again. Keep going.]
- **Why skip it?** [e.g., If you are using a managed service like Clerk/Firebase that does this automatically.]

---

### 🛠️ The Setup (Before You Prompt)
- **Prerequisites (Must Have):** [e.g., Core software installed: Node.js v18+]
- **🔐 Safe Credentials:** Use local/throwaway database keys. Never give AI production keys.
- **Accelerants (Nice to Have):** [e.g., Model Context Protocol (MCP) server running for local codebase context]

---

### 🚀 The Workflow

#### Phase 1: The Blueprint (Context & Specs)
- **Description:** AI needs guardrails before writing code. We start by generating a Technical Document (PRD) to define the exact end result, stack, and constraints.
- **💬 The Prompt:**
  > "I want to build [Feature]. My stack is [Tech A, Tech B]. Act as a Software Architect and write a concise technical specification document. Include data models, expected API routes, and strict constraints."
- **✅ Expected Result:** A clear markdown document mapping out the architecture.
- **💥 Point of Failure:** The AI assumes an architecture pattern you hate.
- **The Fix:** Edit the doc manually. This document will become your `llm.txt` context for the rest of the project.

#### Phase 2: The Build (Iterative Development)
- **Description:** Using the Phase 1 blueprint as context, we start generating the actual components.
- **💬 The Prompt:**
  > "Refer to our technical spec. Write the backend API route for user login. Output only the code and ensure it handles edge cases like missing payloads."
- **✅ Expected Result:** Clean, isolated code for a single feature.
- **💥 Point of Failure:** The AI hallucinates an outdated package version.
- **The Fix:** Read the terminal dependency error. Learn how package managers resolve conflicts instead of blindly pasting errors back to the AI.

#### Phase 3: The Audit (Testing & Verification)
- **Description:** Never trust the code from Phase 2. We now build the tests to prove the AI didn't break anything.
- **💬 The Prompt:**
  > "Write a Playwright E2E test for the login route we just built. The test must verify successful login and rejection of bad passwords."
- **✅ Expected Result:** An automated test script.
- **👁️ Manual Check:** Manually review the test file. Did the AI test for actual edge cases, or just the "happy path"?
- **🛡️ Guardrails:** Run the test suite locally. If it fails, the code doesn't move forward.

#### Phase 4: The Ship (Deployment)
- **Description:** Pushing the verified code to a live environment safely.
- **💬 The Prompt:**
  > "Give me the deployment commands/config for this setup on [Hosting Provider]."

---

### 🛡️ Guardrails & Tests (The Pro Approach)
- **Validation:** Run a CI/CD dry-run (e.g., `terraform plan` or `Prisma diff`) to preview the blast radius. Do not deploy if you see unexpected database drops or server deletions.

---

### 🔭 Next Steps
- **Future Learning:** [Topic to explore next]
- **Links & Manuals:** [Link to Official Docs]