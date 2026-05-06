# 🔄 AI Recipe Phase Adaptations for Non-Coding Workflows

Use these phase replacements in the master poster template when building recipes for different professions or tasks.

---

## 📊 Variant A: Data Analysis & Engineering

### ⚠️ The Reality Check
AI is notoriously bad at math and will confidently invent correlations that don't exist in your CSV.

#### Phase 1: The Blueprint (Schema & Hypothesis)
- **Description:** Do not upload raw data yet. First, tell the AI the structure of your data and what you are trying to prove or disprove.
- **💬 The Prompt:**
  > "I have a dataset with these columns: [A, B, C]. I want to find out if [X affects Y]. Act as a Data Scientist and write a step-by-step plan for how we should clean and analyze this data."
- **💥 Point of Failure:** The AI suggests an analysis method (like a linear regression) that doesn't fit the data type.
- **The Fix:** Ask the AI to justify why it chose that statistical model before proceeding.

#### Phase 2: The Build (Query / Script Generation)
- **Description:** Have the AI write the Python script or SQL query to execute the plan.
- **💬 The Prompt:**
  > "Based on our plan, write the SQL query to extract and aggregate [Metric] by [Category]. Handle null values in column B."
- **💥 Point of Failure:** The AI hallucinates a column name or SQL syntax for a different database engine (e.g., using PostgreSQL syntax for a MySQL database).

#### Phase 3: The Audit (Sanity Check)
- **Description:** Run the script and verify the output before putting it in a report.
- **👁️ Manual Check:** Does the total sum of the output match the raw data? If the AI says 500 users clicked, but your raw CSV only has 400 rows, the AI's script dropped a join somewhere.
- **🛡️ Guardrails:** Use Python libraries like `pandas-profiling` or `Great Expectations` to automatically validate data quality before trusting the AI's output.

#### Phase 4: The Ship (Visualization)
- **Description:** Turning the verified data into a chart or report.
- **💬 The Prompt:**
  > "Here is the verified data output. Write the Python Matplotlib code to generate a clean, modern bar chart for this. Do not use 3D effects."

---

## ✍️ Variant B: Content Creation & Marketing

### ⚠️ The Reality Check
AI defaults to a generic, overly enthusiastic corporate tone (the "AI voice"). It will also hallucinate facts and quotes to sound convincing.

#### Phase 1: The Blueprint (Brand Voice & Brief)
- **Description:** Setting the strict rules of engagement so the AI doesn't sound like a robot.
- **💬 The Prompt:**
  > "We are writing a 1,000-word blog post about [Topic]. Here is our brand voice guide: [paste rules]. Target audience is [Audience]. Create a structural outline with H2 and H3 headers."
- **💥 Point of Failure:** The outline includes irrelevant fluff or overly broad topics.
- **The Fix:** Manually delete the weak headers. Do not let the AI write until the outline is perfectly tight.

#### Phase 2: The Build (Iterative Drafting)
- **Description:** Never ask the AI to "write the whole post." Generate it section by section based on the approved outline.
- **💬 The Prompt:**
  > "Write the content for the first H2 section of our outline. Keep paragraphs under 3 sentences. Do not use words like 'revolutionize', 'delve', or 'landscape'."
- **💥 Point of Failure:** The AI ignores your negative constraints and uses forbidden words anyway.

#### Phase 3: The Audit (Fact & Tone Check)
- **Description:** The most critical step in content. AI is a text predictor, not a truth-teller.
- **👁️ Manual Check:** Verify every single statistic, date, and name the AI generated.
- **🛡️ Guardrails:**
  - Run the text through Grammarly to strip out passive voice.
  - Run a plagiarism check (Copyscape). AI will sometimes spit out verbatim text from its training data.

#### Phase 4: The Ship (Formatting & SEO)
- **Description:** Finalizing the text for publishing.
- **💬 The Prompt:**
  > "Act as an SEO expert. Here is my final article. Generate 3 options for an SEO-optimized meta title (under 60 characters) and a meta description (under 160 characters)."

---

## 🖥️ Variant C: IT Infrastructure & Home Lab (Docker/Linux/Proxmox)

### ⚠️ The Reality Check
AI will frequently suggest outdated configurations, insecure defaults (like `chmod 777`), or dangerous port exposures because it favors the "easiest" way to make something work over the "secure" way.

#### Phase 1: The Blueprint (Architecture & Networking)
- **Description:** Define your hardware, OS, and network layout before asking for commands.
- **💬 The Prompt:**
  > "I want to deploy [Service] on a Proxmox LXC container running Debian 12. My local subnet is [X.X.X.X/24]. Outline the recommended storage layout, network bridge settings, and permission requirements."
- **💥 Point of Failure:** The AI suggests running everything as the root user.
- **The Fix:** Explicitly prompt the AI to rewrite the plan using a non-root service account with least-privilege access.

#### Phase 2: The Build (Config Generation)
- **Description:** Generate declarative files instead of manual bash commands.
- **💬 The Prompt:**
  > "Write the docker-compose.yml to deploy this stack. Map volume paths to ./data. Ensure no database ports are exposed to the host machine, only to the internal docker network."
- **💥 Point of Failure:** AI uses an outdated Docker compose syntax (v2 vs v3) or an old image tag.

#### Phase 3: The Audit (Dry Runs & Security Check)
- **Description:** Verify syntax and security before spinning up the container or VM.
- **👁️ Manual Check:** Read the config file. Are any passwords hardcoded? Are any ports exposed to 0.0.0.0 that shouldn't be?
- **🛡️ Guardrails:** Run `docker-compose config` to validate the YAML syntax without starting the containers. Use tools like `checkov` to scan infrastructure-as-code for security misconfigurations.

#### Phase 4: The Ship (Deployment)
- **Description:** Executing the config and verifying the service is alive.
- **💬 The Prompt:**
  > "What are the terminal commands to bring this stack up in the background and check the initial startup logs?"

---

## 🧯 Variant D: Troubleshooting & Debugging

### ⚠️ The Reality Check
If you just paste an error log, the AI will guess the most common cause. If that guess is wrong, it will likely trap you in an apology death loop.

#### Phase 1: The Blueprint (Context Gathering)
- **Description:** Feed the AI the full picture, not just the final error line.
- **💬 The Prompt:**
  > "I am getting this error: [Paste Error]. Here is the relevant code block: [Paste Code]. The environment is [OS/Framework version]. The last thing I changed before this broke was [Recent Change]."
- **💥 Point of Failure:** The AI gives you a command that completely wipes your current state (e.g., deleting all modules and reinstalling).

#### Phase 2: The Build (Hypothesis Generation)
- **Description:** Ask for theories, not a single blind fix.
- **💬 The Prompt:**
  > "Do not give me a fix yet. Act as a senior systems engineer and list the top 3 most likely root causes for this issue based on the logs."
- **💥 Point of Failure:** The AI hallucinates a non-existent flag or setting that supposedly fixes the issue.

#### Phase 3: The Audit (Isolated Testing)
- **Description:** Test the theories safely.
- **👁️ Manual Check:** Ask the AI: "How can I run a non-destructive test to confirm if Hypothesis 1 is the actual root cause?"
- **🛡️ Guardrails:** If the fix involves a database or infrastructure change, back up the target file or snapshot the VM before applying the AI's suggested commands.

#### Phase 4: The Ship (Post-Mortem & Fix)
- **Description:** Apply the correct fix and document it.
- **💬 The Prompt:**
  > "Hypothesis 2 was correct. The issue was [Root Cause]. Give me the exact commands or code to patch this, and explain how to prevent it from happening again."

---

## 📚 Variant E: STEM & Academic Learning (Tutoring Flow)

### ⚠️ The Reality Check
AI is built to give you answers. If you are trying to learn, giving you the answer is counterproductive. You have to force the AI into a pedagogical role.

#### Phase 1: The Blueprint (Goal & Socratic Setup)
- **Description:** Tell the AI exactly how you want to be taught.
- **💬 The Prompt:**
  > "I am learning [Topic, e.g., Calculus limits or Cell Mitosis]. Act as a strict but encouraging university tutor. I am going to give you problems. Do NOT solve them for me. Instead, ask me guiding questions to help me solve them myself."
- **💥 Point of Failure:** The AI breaks character and just gives you the final answer anyway.
- **The Fix:** Remind it: "You gave me the answer. Revert to your persona. Give me a new problem and only ask me for the first step."

#### Phase 2: The Build (Step-by-Step Breakdown)
- **Description:** Deconstruct complex concepts interactively.
- **💬 The Prompt:**
  > "I don't understand the concept of [Specific Concept, e.g., pointers in C++]. Break it down using a physical world analogy. Stop after the first analogy and ask me if it makes sense."

#### Phase 3: The Audit (The Feynman Technique)
- **Description:** Prove you actually learned it, rather than just nodding along with the AI.
- **👁️ Manual Check:**
  > "I am going to explain [Concept] back to you in my own words. Point out any gaps in my logic or technical inaccuracies."
- **🛡️ Guardrails:** For math or physics, do not trust the AI's arithmetic. If it teaches you a formula, verify the final calculation using a calculator or ask the AI to write a Python script to compute the answer.

#### Phase 4: The Ship (Application)
- **Description:** Testing your knowledge under pressure.
- **💬 The Prompt:**
  > "Generate 3 practice questions on this topic ranging from beginner to advanced. Do not give me the answers. Wait for my response."

---

## 🗣️ Variant F: Language Learning (Immersion & Practice)

### ⚠️ The Reality Check
AI is not a native speaker; it is a statistical probability engine. It will sometimes use overly formal phrasing or regional dialects that clash.

#### Phase 1: The Blueprint (Level & Context Setting)
- **Description:** You must define your exact proficiency level so the AI doesn't overwhelm you with advanced vocabulary.
- **💬 The Prompt:**
  > "I am learning [Language] at a [CEFR Level, e.g., A2 Beginner] level. Act as my native conversation partner. The context is [e.g., ordering food at a busy cafe]. Keep your sentences short."
- **💥 Point of Failure:** The AI responds with perfectly correct, but highly archaic or textbook-sounding dialogue.

#### Phase 2: The Build (Active Roleplay)
- **Description:** Engaging in the conversation block by block.
- **💬 The Prompt:**
  > "Let's begin the roleplay. You start as the barista. Respond to my messages strictly in [Language]. If I make a grammar mistake, stop the roleplay, point out the error in English, and tell me why it's wrong before continuing."

#### Phase 3: The Audit (Grammar Sanity Check)
- **Description:** Verifying the AI's corrections.
- **👁️ Manual Check:** Sometimes AI hallucinates grammar rules to justify a correction. Ask it to cite the specific grammatical concept (e.g., "Is this because of the subjunctive mood?").
- **🛡️ Guardrails:** Cross-reference complex grammar corrections with an official language manual or a dedicated tool like WordReference forums.

#### Phase 4: The Ship (Vocabulary Extraction)
- **Description:** Committing the conversation to long-term memory.
- **💬 The Prompt:**
  > "Review our conversation. Extract the 10 most useful vocabulary words or idioms I didn't know. Format them as a CSV list with the target language word, English translation, and an example sentence so I can import it into my Anki flashcard deck."

---

## 🎲 Variant G: Tabletop RPGs (D&D / Game Mastering)

### ⚠️ The Reality Check
AI has terrible long-term memory. Over a 3-hour game session, it will forget NPC names, plot points, and the fact that the party's rogue is currently at 1 HP.

#### Phase 1: The Blueprint (Rules & Setting the Scene)
- **Description:** Establish the strict mechanics the AI must operate under.
- **💬 The Prompt:**
  > "Act as my Game Master Assistant for D&D 5e. The setting is [Tone/World]. We are strictly following Rules As Written (RAW). Never roll dice for me, and never make decisions for player characters."
- **💥 Point of Failure:** The AI balances encounters poorly, throwing a CR 15 dragon at a level 3 party because it "fits the narrative."
- **The Fix:** Force the AI to show its math: "Recalculate this encounter using the official Daily XP budget for a party of four Level 3 characters."

#### Phase 2: The Build (Encounter Generation)
- **Description:** Generating the actual game content.
- **💬 The Prompt:**
  > "Generate a random combat encounter for an abandoned sewer. Include 3 distinct monster types, a hidden environmental hazard, and the exact Monster Manual stat blocks."

#### Phase 3: The Audit (Mechanics Sanity Check)
- **Description:** Verifying the AI isn't hallucinating game mechanics.
- **👁️ Manual Check:** Read the stat blocks. Did the AI invent a spell that doesn't exist? Did it give a goblin 200 hit points?
- **🛡️ Guardrails:** Always have the official Player's Handbook or an SRD wiki open. The AI's job is flavor; your job is enforcing the rules.

#### Phase 4: The Ship (Session Execution)
- **Description:** Using the AI at the table during live play.
- **💬 The Prompt:**
  > "Summarize the sewer encounter we just built into a 3-sentence 'read-aloud' boxed text. Focus heavily on sensory details: what the players smell, hear, and see as they open the door."

---

## 🛠️ Variant H: Hardware Tinkering & Electronics (Arduino/ESP32/Raspberry Pi)

### ⚠️ The Reality Check
AI will frequently hallucinate pinout diagrams, suggest incorrect resistor values that could damage your components, or provide code that uses blocking `delay()` calls which break real-time responsiveness.

#### Phase 1: The Blueprint (Schematic & Component Selection)
- **Description:** Define your hardware components and goal before wiring anything.
- **💬 The Prompt:**
  > "I want to build [Project, e.g., a Wi-Fi weather station]. I have an [MCU, e.g., ESP32] and these components: [List, e.g., DHT22, OLED display]. Act as an Electronics Engineer and provide a wiring diagram description, pin assignments, and necessary power requirements."
- **💥 Point of Failure:** The AI suggests using a "strapping pin" or a pin that is restricted during boot, causing the MCU to fail to start.
- **The Fix:** Explicitly ask the AI to verify if the suggested pins have any special boot-time restrictions or dual-purposes on your specific board.

#### Phase 2: The Build (Firmware & Circuit Logic)
- **Description:** Generate the code for the MCU (Arduino C++, MicroPython, etc.).
- **💬 The Prompt:**
  > "Write the [Language] code for this setup. Use non-blocking timing (e.g., `millis()` in Arduino) instead of `delay()`. Include clear comments for every pin assignment and library dependency."
- **💥 Point of Failure:** The AI uses a library that is deprecated or incompatible with your specific hardware architecture.

#### Phase 3: The Audit (Hardware Safety & Code Review)
- **Description:** Check for "magic smoke" risks and logical errors before applying power.
- **👁️ Manual Check:** Cross-reference the AI's suggested pinout with the official physical pinout diagram of your board. Never trust an AI's internal "map" of GPIO pins without verification.
- **🛡️ Guardrails:** Use a multimeter to check for continuity/shorts between 5V/3.3V and Ground before plugging in the USB cable. Verify resistor values using an online Ohm's Law calculator.

#### Phase 4: The Ship (Enclosure & Final Polish)
- **Description:** Optimizing the project for permanent use.
- **💬 The Prompt:**
  > "Suggest a 3D printable enclosure layout for this project that allows for [Ventilation/Battery access]. What are the best practices for moving this from a breadboard to a permanent soldered perfboard?"

---

## 🎬 Variant I: Digital Content & Motion Design (Animation/Video/Ads)

### ⚠️ The Reality Check
AI lacks a native sense of "timing," "rhythm," and "flow." It might suggest high-energy animations for a somber topic or write scripts that are too wordy for the intended visual pacing.

#### Phase 1: The Blueprint (Script & Storyboard)
- **Description:** Define the narrative arc and visual transitions before touching any software.
- **💬 The Prompt:**
  > "I am creating a [Length, e.g., 15-second] social media ad for [Product]. Target audience is [Audience]. Write a script with two columns: 'Audio/Voiceover' and 'Visual/Motion Description'. Keep the pacing fast and punchy."
- **💥 Point of Failure:** The AI's storyboard descriptions are too vague to be actionable (e.g., "A cool transition happens here").
- **The Fix:** Ask the AI to specify the *type* of transition (e.g., "A smooth whip-pan transition from left to right").

#### Phase 2: The Build (Asset Generation & Motion Logic)
- **Description:** Using the storyboard to generate specific assets (images, voiceovers, or animation code).
- **💬 The Prompt:**
  > "Based on our storyboard for Scene 1, describe the ideal visual aesthetic in detail so I can generate it or film it. Also, provide the exact CSS/GSAP code snippet for the [Specific Element] animation."

#### Phase 3: The Audit (Pacing & Brand Alignment)
- **Description:** Reviewing the draft against the original goals.
- **👁️ Manual Check:** Read the script aloud with a stopwatch. Does it actually fit the 15-second limit? AI-generated scripts are almost always 30% too long.
- **🛡️ Guardrails:** Check the color contrast and legibility of any text overlays. Ensure the "Hook" happens in the first 3 seconds.

#### Phase 4: The Ship (Rendering & Format Optimization)
- **Description:** Finalizing the export for specific platforms.
- **💬 The Prompt:**
  > "What are the optimal export settings (resolution, bitrate, file format) for [Platform, e.g., TikTok vs YouTube]? Also, suggest 3 'Hook' captions for the post."

---

## 🎨 Variant J: Graphic Design & Publishing (Posters/Documents/Layouts)

### ⚠️ The Reality Check
AI often fails at precise physical measurements (bleed, margins, DPI) and might suggest font pairings that lack proper visual hierarchy or look "generic."

#### Phase 1: The Blueprint (Layout Specs & Moodboard)
- **Description:** Establishing the physical constraints and visual direction.
- **💬 The Prompt:**
  > "I am designing a [Format, e.g., A3 Poster/12-page Brochure] for [Event/Brand]. The theme is [Style, e.g., Minimalist Swiss Design]. Define the grid system, margin requirements, and a 3-color primary palette."
- **💥 Point of Failure:** The AI suggests colors that look good on screen but won't print well (RGB vs CMYK).
- **The Fix:** Ask for the CMYK or Pantone equivalents of the suggested hex codes.

#### Phase 2: The Build (Composition & Typography)
- **Description:** Placing content into the grid and establishing hierarchy.
- **💬 The Prompt:**
  > "Suggest 3 font pairings for this layout: one for the 'Hero' headline, one for sub-headers, and one for body text. Explain why these fonts complement each other in a [Style] context."

#### Phase 3: The Audit (Print Readiness & Accessibility)
- **Description:** The technical check before the final "Save."
- **👁️ Manual Check:** Verify the "Bleed" area. Is any critical text too close to the edge where it might be cut off?
- **🛡️ Guardrails:** Check color contrast ratios for text overlays using WCAG standards. Verify that all images are at least 300 DPI for print.

#### Phase 4: The Ship (Final Export & Distribution)
- **Description:** Preparing the file for the printer or digital distribution.
- **💬 The Prompt:**
  > "Give me a checklist for exporting this for professional offset printing. What specific PDF standard (e.g., PDF/X-1a) and marks (crop, bleed) should I include?"