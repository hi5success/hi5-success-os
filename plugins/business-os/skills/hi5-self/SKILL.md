---
name: hi5-self
description: Personality and communication profile builder for Hi5 Success OS. Assesses the member's behavioral style, decision-making patterns, energy type, and communication preferences using 30 guided questions with multiple choice answers. Used to tailor all Hi5 skill outputs to the member's personality. Triggers when the user runs /hi5-self, says "personality assessment", "learn about me", or "profile assessment". Can also be triggered automatically at the end of /hi5-setup.
---

# Hi5 Self: Personality Profile Skill

## Purpose
Learn how the member thinks, communicates, makes decisions, and is motivated. Store this profile in their Master Profile so every Hi5 skill, business plan, scripts, emails, goals, is tailored to their personality and not a generic output.

## Core Rules
- One question at a time
- Always provide multiple choice options. They can always add more detail after selecting
- Never rush: this is one of the most valuable things we can capture
- After scoring, always explain what their profile means in plain language
- Always recommend free external tools to go deeper

---

## OPENING

> "This is one of the most important things we will do together, and it is what makes Hi5 Success OS different from every other tool out there.
>
> Most AI tools give everyone the same output. Ours adapts to how YOU think, communicate, and make decisions. Every business plan, every script, every email we create together will be written for your personality, not a generic agent or business owner.
>
> To do that I need to learn a few things about you. I will ask you 30 questions with multiple choice answers. Just pick what feels most like you. There are no wrong answers. You can always add more detail after selecting an option.
>
> This takes about 10 minutes. Ready to go?"

---

## PATH SELECTION

> "Do you already have any personality assessment results you can share?"
>
> A) Yes: I have my DISC profile results (paste them in)
> B) Yes: I have my Human Design chart (paste it or tell me your type)
> C) Yes: I have both
> D) I want to take a proper assessment first: point me to free tools
> E) No: let's go through your questions now

### If D selected: Free Tools:
> "Here are the best free options:
>
> **Behavioral Style (DISC-style):**
> 123test.com/disc-personality-test: free, takes 10 minutes
>
> **Human Design:**
> mybodygraph.com: free, needs your birth date, time, and location
>
> **Myers-Briggs Style:**
> 16personalities.com: free, takes 12 minutes
>
> Take whichever resonates, then come back and paste your results. I will interpret everything and store it in your profile.
>
> Or if you want to skip the external tools and just answer my questions now, say the word and we will get started."

### If they paste results:
Interpret the results, summarize in plain language, store in Master Profile, then ask the communication and content style questions from Section 3 below since those are not covered by standard assessments.

### If E selected: proceed to full 30 question flow below.

---

## SECTION 1: How You Work (8 questions)

**Q1**
> "When you have a big decision to make, what is most like you?"
>
> A) I decide fast and move: I can adjust later
> B) I talk it through with someone: I think out loud
> C) I want everyone on board before I commit
> D) I research thoroughly before I decide anything
>
> Want to add anything?"

**Q2**
> "When something goes wrong in your business, your first reaction is:"
>
> A) Fix it immediately and move on
> B) Tell someone: I need to process it out loud
> C) Make sure the people around me are okay first
> D) Figure out exactly what went wrong before acting

**Q3**
> "In a group setting you are usually:"
>
> A) The one driving decisions and moving things forward
> B) The one energizing the room and keeping it fun
> C) The one making sure everyone feels heard
> D) The one asking the right questions and analyzing

**Q4**
> "How do you prefer to receive feedback?"
>
> A) Direct and blunt: just tell me
> B) Conversational and encouraging
> C) Gentle and thoughtful
> D) Detailed with examples and data

**Q5**
> "Your work energy looks like:"
>
> A) Intense bursts: I go hard then recover
> B) High energy around people, lower when alone
> C) Steady and consistent throughout the day
> D) Deep focus for long stretches on one thing

**Q6**
> "When you start a new project you typically:"
>
> A) Jump in and figure it out as I go
> B) Get excited, tell everyone, then build momentum
> C) Make sure I have support and a clear plan first
> D) Map everything out before taking the first step

**Q7**
> "Your biggest strength in your business is:"
>
> A) Getting things done fast and driving results
> B) Building relationships and getting people excited
> C) Creating trust and keeping things stable
> D) Solving complex problems with the right information

**Q8**
> "When you are overwhelmed you tend to:"
>
> A) Push through and power past it
> B) Talk to someone to get out of my head
> C) Slow down and take care of myself and others
> D) Step back, analyze the situation, and make a plan

---

## SECTION 2: How You Communicate (8 questions)

**Q9**
> "When you explain something to a client you lead with:"
>
> A) The bottom line: here is what you need to know
> B) A story or example that makes it real
> C) Reassurance that I have got them covered
> D) Facts, data, and evidence

**Q10**
> "Your content style naturally sounds like:"
>
> A) Bold, direct, no fluff
> B) Warm, conversational, entertaining
> C) Supportive, trustworthy, community-focused
> D) Detailed, educational, credibility-driven

**Q11**
> "When a client pushes back or disagrees you:"
>
> A) Hold my position confidently
> B) Try to find common ground and keep it positive
> C) Listen carefully and make sure they feel heard
> D) Back up my point with facts and logic

**Q12**
> "Your best clients would describe working with you as:"
>
> A) Efficient, confident, and gets results
> B) Fun, energetic, and genuinely cares
> C) Trustworthy, patient, and always there
> D) Knowledgeable, thorough, and reliable

**Q13**
> "When you create content your biggest challenge is:"
>
> A) Slowing down enough to explain the details
> B) Staying focused on one topic instead of going everywhere
> C) Putting myself out there and being visible
> D) Making it feel personal instead of just informational

**Q14**
> "The type of content that feels most natural for you is:"
>
> A) Bold takes, opinions, and calls to action
> B) Stories, behind the scenes, and personality-driven
> C) Tips, how-tos, and community value
> D) Market data, deep dives, and educational breakdowns

**Q15**
> "How long does it take you to write a caption or email?"
>
> A) Fast: I write what I think and move on
> B) It flows when I am in the mood but I get distracted
> C) I overthink it and rewrite it multiple times
> D) A long time: I want it to be accurate and thorough

**Q16**
> "What words or phrases do you find yourself saying constantly, in conversations, on calls, or in your content? Just type a few that come to mind."
*(Open ended)*
Store: PROFILE.signature_phrases

---

## SECTION 3: How You Are Motivated (7 questions)

**Q17**
> "What drives you most in your business right now?"
>
> A) Winning: hitting big goals and being the best
> B) Impact: inspiring others and being known
> C) Stability: building something secure and lasting
> D) Mastery: becoming the most knowledgeable in my field

**Q18**
> "You feel most successful when:"
>
> A) You hit a big number or close a major deal
> B) Someone tells you that you inspired or helped them
> C) Your clients, family, and team are happy and taken care of
> D) You figure out a complex problem nobody else could solve

**Q19**
> "What makes you lose motivation fastest?"
>
> A) Slow progress, too many rules, micromanagement
> B) Working alone with no interaction or feedback
> C) Conflict, instability, or feeling unsupported
> D) Moving too fast without a clear plan or enough information

**Q20**
> "Your ideal workday looks like:"
>
> A) Back to back action: calls, decisions, results
> B) A mix of people time, creative work, and flexibility
> C) A steady predictable schedule with time for relationships
> D) Deep uninterrupted focus time to think and create

**Q21**
> "When you set a goal you:"
>
> A) Set it big, commit publicly, and go after it hard
> B) Get excited about the vision and share it with everyone
> C) Make sure it is realistic and has a support system around it
> D) Break it into a detailed step-by-step plan first

**Q22**
> "What does success look like for you beyond the numbers? More time with family? Build a team? Become the known name in your market? Travel more? Describe it in your own words."
*(Open ended)*
Store: PROFILE.success_vision

**Q23**
> "What is the single biggest thing holding you back right now?"
*(Open ended)*
Store: PROFILE.biggest_blocker

---

## SECTION 4: Human Design Indicators (7 questions)

**Q24**
> "When opportunities come to you, what feels most natural?"
>
> A) I initiate: I create my own opportunities and go get them
> B) I respond: my best moves happen when I react to what shows up
> C) I wait to be invited before I share my expertise or take action
> D) I sample different things over time before I fully commit

**Q25**
> "Your energy throughout the day feels like:"
>
> A) Consistent and reliable: I can go all day
> B) It comes in waves: sometimes I am on fire, sometimes I need to stop
> C) It depends on who I am around: I absorb the energy of others
> D) Quiet and focused: I do not have high energy but I have deep clarity

**Q26**
> "When you make your best decisions they usually come from:"
>
> A) A clear gut feeling in the moment
> B) Sleeping on it and seeing how it feels over time
> C) Talking it through until something clicks emotionally
> D) Waiting until something just feels right or correct

**Q27**
> "In your business you naturally:"
>
> A) Start things and hand them off: initiating is my gift
> B) Do my best work when responding to what is already in motion
> C) Guide and advise others: I see what others miss
> D) Need to sample and explore before I find my lane

**Q28**
> "How do you feel after a full day of back to back people interaction?"
>
> A) Energized: that is when I am at my best
> B) Satisfied but ready to decompress
> C) Drained: I need alone time to reset
> D) Depends entirely on the people and the purpose

**Q29**
> "When you read or hear something new you:"
>
> A) Know immediately if it is right for you
> B) Need time to process before you know how you feel
> C) Need to talk it through to know what you think
> D) Research it extensively before forming an opinion

**Q30**
> "Do you have a consistent sense of who you are regardless of who you are around, or does your identity shift based on your environment?"
>
> A) Consistent: I am the same everywhere
> B) I adapt but my core stays the same
> C) I genuinely take on the energy and identity of who I am around
> D) It depends on the context

---

## SCORING AND OUTPUT

After all 30 questions score as follows:

### Behavioral Style Scoring:
Count answers by letter across Sections 1-3:
- Mostly A → High D (Driver): direct, decisive, results-focused
- Mostly B → High I (Influencer): energetic, relational, big picture
- Mostly C → High S (Steady): loyal, supportive, consistent
- Mostly D → High C (Conscientious): analytical, detail-oriented, accurate
- Mixed → note the combination (e.g. D/I blend, S/C blend)

### Human Design Approximation (Section 4):
- Mostly A → Manifestor tendencies: initiates, independent, bursts of energy
- Mostly B → Generator/MG tendencies: responsive, sustainable energy, needs to respond
- Mostly C → Projector tendencies: guide and advisor, invitation-based, selective energy
- Mostly D → Reflector tendencies: samples environments, lunar cycle decisions, rare

Note: Always clarify this is an approximation and recommend mybodygraph.com for official type.

---

## PROFILE SUMMARY OUTPUT

Deliver a plain language summary:

> "Here is what I learned about you, [name]:
>
> **Your Behavioral Style: [Type]**
> [2-3 sentences describing what this means for how they work and lead]
>
> **Your Communication Style:**
> [How they naturally communicate, what content feels authentic, how clients experience them]
>
> **Your Motivation:**
> [What drives them, what drains them, how to frame goals]
>
> **Your Energy Type (approximate): [Type]**
> [What this means for how they work and make decisions]
> Note: For your official Human Design type visit mybodygraph.com. You will need your birth date, time, and location.
>
> **How this changes everything I create for you:**
> Every business plan, script, email, and piece of content we build together will be written for [their style], not a generic template. A [their type] needs [specific things]. You will see the difference immediately.
>
> Want to go deeper on any of this before we move on?"

---

## STORAGE

Save full profile to Master Profile under section: "Self Profile". Insert it inside that section. Never append it at the end of the page, because the end of the page holds the Linked pages heading and child pages

Fields stored:
- behavioral_style (D/I/S/C dominant)
- behavioral_blend (if mixed)
- human_design_approximate
- communication_style
- content_style
- decision_style
- energy_pattern
- motivation_driver
- success_vision
- biggest_blocker
- signature_phrases
- receives_info_best (derived from scoring)

---

## NEXT STEP

> "Now that I know how you think and communicate, let's build your business plan. Run /hi5-bizplan and I will create a personalized roadmap tailored specifically to you, your market, and your goals.
>
> Ready?"
