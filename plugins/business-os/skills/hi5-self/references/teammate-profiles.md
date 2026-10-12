# Team Profiles

Used by `SKILL.md` when the member says the profile is for someone on their team, and when the member's own profile is saved. Profiles live in the People database (one row and one page per person). The Master Profile's Self Profile section stays the member's own source of truth, and the member's People row links to it. Never rename or remove a Self Profile field.

## Scan first
Read the People database (`people_db_id` in the Page IDs) for the person's row (match by name or email), the Master Profile, and anything the member pasted. If the person already has a profile, say so and ask whether to update it, replace an estimate with their own answers, or leave it. If `people_db_id` is missing or does not open, offer to add the database (see "Missing People database" below). Ask only about what you could not find.

## Who is it for
Ask: "Is this for you or for someone on your team?"
- **For the member:** run the 30 questions as written in `SKILL.md`. At the end, also create or refresh the member's own People row (below).
- **For a teammate:** ask for their name, role, email (optional), and who they report to. Then offer the two ways to build the profile.

## Way 1 (best): the teammate answers themselves
Offer the copy-paste question set in `teammate-questions.md`. Tell the member: "They answer these themselves, which is more accurate than your guess. Send it however you usually message them. When they reply, paste the answers here and I'll build their profile." Create the People row now with Status "Waiting for answers" only if the member wants a placeholder, and say so.
When the member pastes answers back:
1. Score the behavioral questions by the same letter rules as `SKILL.md` (primary answer counts fully, a second answer only breaks ties).
2. Read the communication preference questions directly (length, format, detail, directness, what to lead with).
3. Save the profile as "Own answers" (below).

## Way 2: the member fills it in from observation
If the member wants to answer for the teammate, ask the same questions in the third person ("When she has a big decision, what is she most like?") with multiple choice, one at a time. Label the profile **Estimated by [member name]** in three places: the Profile source property, the first line of the person's page, and the front of the Personality profile field. Say once: "This is your read of them, so I'll use it lightly. If they answer the questions themselves later, I can replace it. Want me to remind you to offer that?" Never present an estimate as the person's own result.

## Human Design
Ask only if the member wants it and the person has agreed. Say why: "Human Design needs a birth date, time, and place, so I only ask with the person's OK. It is used to understand their energy and decision pattern, not to judge them." Prefer this path: the teammate generates their own chart in a free tool and sends only the type and authority. Do not save a birth date, birth time, or birth place anywhere. If the member gives them, use them once to read the type, say the approach is an approximation unless it came from a chart tool, and do not store them. If the person has not agreed, record "Not shared" and move on. Never guess a Human Design type for someone from observation.

## Save to the People database
One row and one page per person. Show the row before writing and wait for the member's OK.
- **Name** (title), **Role**, **Email**, **Reports to** (the manager's name exactly as it is in People, or the member's name), **Human or AI** (always Human here), **Personality profile** (one line, for example "S/C blend, own answers"), **Human Design profile** (one line, or "Not shared"), **Communication tips** (the reader guide below), **Status** (Active, Waiting for answers, or Former), **Profile source** (Own answers or Estimated), **Profile date**.
- **Communication tips** is the field other skills read. Write five short lines: length, format (bullets, a short story, or a table), detail level, directness, and what to lead with. Base each line on their answers. Never write a line the answers do not support.
- **The page** follows `templates/person-page.md`.
- The member's own row: copy the summary from the Self Profile, link to it, and set Reports to blank unless the member has one.

## Rules
- Profiles are for communicating and working together better. Never use one for hiring, firing, pay, promotion, or discipline, and never as a reason to treat someone differently. Say this once when the first teammate profile is made.
- Never save health information, family details, religion, age, or other personal facts. Keep to work style and communication needs.
- A teammate can ask to see, correct, or delete their profile at any time. Do it with the member's OK.
- Never stereotype. A style describes tendencies, not limits.
- Never write a profile into a message. Skills use it to shape structure only.
- No em dashes.

## Missing People database
If the member has no People database, say: "Your People database isn't in your workspace yet. I can add it with the standard Hi5 layout. OK?" If they agree, create ONE database named People under the root page with the properties in `hi5-setup/templates/workspace-build.md`, and save its ID as `people_db_id` in Page IDs. If they say no, save the profile on a page under the Master Profile instead and say you will move it later. Never create a duplicate.
