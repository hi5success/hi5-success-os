# The Email Widget and Its Buttons

Used by `widgets.md` and `build.md`. Verify the exact tool names and arguments in the session before you build (see `build.md`), and never guess.

## Hard rules
1. **Never link or redirect to Gmail or any mail app.** No "Open in Gmail" link, button, or card anywhere, and no task, card, or message that points to the mail app. The thread opens inside the dashboard.
2. **Opening an email auto-drafts a reply in the member's voice.** The draft is ready when the thread opens, for that one email.
3. **Context for the draft is read only.** Read the full thread, plus recent threads with the same sender. Take facts only from those. Anything missing is a [PLACEHOLDER] that says what is needed. Never invent a fact, price, date, promise, or commitment.
4. **The reply box is editable, and Send is one click per message.** Nothing sends unless the member clicks Send on that one message. A mailbox action (mark read, label, archive, spam) happens only from a click, using the setting the member chose.

## What the list shows
Emails that need a reply, newest need first. For each: who, the subject, how long it has waited, and one line on why it needs a reply (for example "asked a question", "asked for a time"). No draft is made for the list. A draft is made when one email is opened.

## What counts as needing a reply
- The latest message in the thread is from someone else, and it asks something or needs an answer.
- Not from the member, and not yet answered.
Filter out obvious spam and low-priority mail: promotions and social updates, automated "no-reply" senders, newsletters, and receipts, using the mailbox's own categories and sender patterns. Let the member name senders to always show and senders to always hide, and save those lists on the Dashboards entry. Never delete anything in the mailbox as part of filtering.

## Opening an email (inside the dashboard)
- Tapping an email opens a reader view in the same page: the sender, the subject, and the messages of the thread in order (the full thread), each with its sender and time. Show message text as plain text, never as a link to the mail app. A back button returns to the list.
- Read the thread with the email connector's thread read (read only). Do not mark it as read unless the member chose that for No reply needed.

## The auto-draft
When the thread opens, in this order:
1. **Read the full thread** (all messages).
2. **Read recent threads with the same sender** (read only): search the mailbox for the sender's address, take the few most recent other threads (for example up to 5 from the last 90 days), and read what you need from each. Skip anything that is clearly unrelated. Never read other people's threads, and never write to the mailbox.
3. **Write the reply** in the member's voice (the voice rule in `SKILL.md`), short, answering what the latest message asks. Facts come only from the thread and those recent threads. A date, price, document, or promise that is not in them becomes a [PLACEHOLDER]. If the member's business has a required disclosure line, add it. Follow every other Hi5 rule (no em dashes, compliance, privacy, no invented commitments).
4. **Show it in an editable box,** with one line under it saying what it used ("Used this thread and 2 earlier threads from this sender") and any placeholders to fill. If the draft cannot be made (the model call fails), say so and leave an empty box, never a made-up draft.
Make the draft once per open. A "Redraft" button makes a new one on a click.

## The buttons
1. **Send.** Sends that one reply, in the same thread, after the member's edits. Clicking Send is the approval for that message, so show the exact text, the recipient, and the subject next to the button. Refuse to enable Send while a [PLACEHOLDER] is still in the text. Send one message at a time. Never send automatically, in bulk, or on a retry. If a send fails, say so and do not send again until the member clicks again (a failed send can be an unknown outcome, so check the thread first). After a send, remove the email from the list and close its task (see `email-tasks.md`).
2. **Make a task.** Makes one task in the member's task home (see `tasks.md`) for an email the automatic job skipped or the member wants to track differently (a due date the member picks, a link that opens the thread in the dashboard), after showing it. Never a second task for a thread that already has one.
3. **No reply needed.** Always removes the email from the dashboard and closes its task. During setup, ask once what else it should do in the mailbox: nothing (the default), add a label (and which label name), mark as read, or archive. Save the choice. The member can change it later.
4. **Spam.** Removes the email from the dashboard and marks it as spam in the mailbox. Confirm the first time the member uses it ("This also marks it as spam in your mailbox. OK?"), save that the confirm was given, and do not ask again. Offer an Undo for a few seconds.

## Undo for No reply needed and Spam
Hold the mailbox action for a few seconds (for example 8 seconds) after the click and show an "Undo" button with a countdown. If the member clicks Undo, cancel the action and put the email back on the dashboard. If the countdown ends, run the mailbox action. This is safer than reversing an action afterward.

## Dismissals and settings
- "No reply needed" and "Spam" remove the email from the dashboard for good (until a new message arrives in the thread). Keep the list of dismissed thread IDs in the dashboard's own data store, not in Notion, because it is display state, not business data.
- The email button settings (the no-reply action, the label name, the spam confirm, the always-show and always-hide sender lists, and the email to task choice) are saved on the Dashboards entry.

## Texting from the dashboard
A text reply (for example from the CRM or Slack widgets where a text is possible) needs the same gate every time, before any text is drafted or sent:
1. Consent: read the member's `consent_source` on the CRM Map, and the contact's record (a form submission, a tag, or a field). Unknown means no text.
2. Not do-not-disturb, not unsubscribed, not marked STOP.
3. Inside 8am to 9pm in the person's own time zone.
If it fails, do not show a text option, and offer an email or a call instead, with the reason in one line.

## Never
Never send, label, archive, or mark as spam without the member's click. Never link to the mail app. Never read or show mail the member did not connect the dashboard to see. Never keep message text in Notion or in a task beyond the one reason line. Never use em dashes.
