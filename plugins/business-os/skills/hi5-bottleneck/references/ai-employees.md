# AI Employees

Used by `SKILL.md` Step 7. An AI employee is a role with several recurring duties, one human manager, a written job description, and a review date. It is not a magic worker. It is a Claude Project plus skills and scheduled tasks that do a defined job and hand off to a person when it should.

## Pick the right build
- **A Claude Project** is the home of the role: its instructions (the job description in working form), its knowledge (files and pages it reads), and its connectors. Write the instructions as text to paste, with steps. Use `../templates/project-instructions.md`.
- **Skills** for jobs it does by command, saved with the save skill card plus a backup file.
- **Scheduled tasks** for recurring jobs that are read only or draft only (a morning summary, a weekly check). Offer them with the schedule and the prompt, and create them only with the member's OK.
- **Nothing else.** Never give an AI employee the ability to send, publish, spend, or change records on its own.

## The job description (eleven parts)
Write it with `../templates/job-description.md`, and show it before saving.
1. **Name and role.**
2. **Human manager.** Exactly one person, as named in People.
3. **Purpose.** One sentence.
4. **Duties.** The recurring jobs, each with how often.
5. **Inputs and outputs.** What it reads and what it produces, and where the outputs go.
6. **Tools and connectors.** Read only unless the member approves more, one at a time.
7. **What it may and may not do.** Always include the Hi5 rules below.
8. **When to hand off to its human.** The situations that need judgment, a relationship, a compliance decision, a complaint, a legal or money question, or anything it is unsure about.
9. **Hi5 rules.** See below.
10. **Success measures.** How the manager will know it is working (hours saved, errors, response time), using the member's own numbers.
11. **Review cadence.** Monthly, Quarterly, or Twice a year, chosen by the member, with the first review date.

## Hi5 rules for every AI employee
- Drafts first. It prepares work for its human to approve.
- It never sends, publishes, spends money, or changes a record on its own. Anything outward is one approved action at a time, approved by its human manager.
- Consent gates: texts only with documented consent and never to do-not-disturb or STOP, and email follows the opt-out rules.
- Compliance: the disclosure line, advertising and messaging rules, and for real estate Fair Housing (never rank, filter, or describe people by who they are).
- Privacy: no passwords, full account numbers, or sensitive personal data in its knowledge or its outputs.
- No em dashes, and anything written to others uses the right voice.
- It says when it does not know, and it hands off instead of guessing.

## Save and add to the chart
1. Show the AI Employees row (Name, Role, Human manager, Status, Review cadence, Review date, Claude Project link, Created) and the job description page. Write them after the member's OK. If `hi5-org-chart` already made a stub row for it, update that row instead of creating a second one.
2. Status starts as Draft and becomes Active only when the member says it is running.
3. Check that the human manager is one person in People. If not, ask who it is.
4. Add it to the org chart under that manager: the chart is built from the database, so after saving, offer to run /hi5-org-chart, or, if the member's People page has an org chart link, offer to republish the chart (follow `../../hi5-org-chart/references/chart-artifact.md`).
5. Ask the member to set a calendar reminder for the review date.
