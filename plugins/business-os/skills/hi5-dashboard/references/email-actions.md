# The Email Widget and Its Buttons

Used by `widgets.md` and `build.md`. Nothing sends unless the member clicks send on that one message. A mailbox action happens only from a click, using the setting the member chose. Verify the exact tool names and arguments in the session before you build (see `build.md`), and never guess.

## What it shows
Emails that need a reply, newest need first. For each: who, the subject, how long it has waited, one line on why it needs a reply (for example "asked a question", "asked for a time"), and a drafted reply in the member's voice that the member can edit.

## What counts as needing a reply
- The latest message in the thread is from someone else, and it asks something or needs an answer.
- Not from the member, and not yet answered.
Filter out obvious spam and low-priority mail: promotions and social updates, automated "no-reply" senders, newsletters, and receipts, using the mailbox's own categories and sender patterns. Let the member name senders to always show and senders to always hide, and save those lists on the Dashboards entry. Never delete anything in the mailbox as part of filtering.

## The drafted reply
- Draft on the member's request for each email (a "Draft reply" button, or when they open it), not for the whole inbox at once.
- Write in the member's voice (the voice rule in `SKILL.md`), short, with the facts only from the thread. Never invent a fact, a price, a date, a promise, or a commitment. Use a [PLACEHOLDER] and say what is missing.
- Follow every other Hi5 rule (no em dashes, compliance and disclosure rules, privacy). If the member's business has a required disclosure line, add it.
- The member can edit the text in a box before sending.

## The four buttons
1. **Send.** Sends that one reply, in the same thread, after the member's edits. Clicking Send is the approval for that message, so show the exact text, the recipient, and the subject next to the button. Send one message at a time. Never send automatically, in bulk, or on a retry. If a send fails, say so and do not send again until the member clicks again (a failed send can be an unknown outcome, so check the thread first). After a send, remove the email from the dashboard.
2. **Make a task.** Creates a follow-up task in the Notion Tasks database (title from the subject, a due date the member picks, a link to the email) and, if GoHighLevel is connected and the member wants it, in GHL after showing it. Then remove the email from the list or mark it "task made".
3. **No reply needed.** Always removes the email from the dashboard. During setup, ask once what else it should do in the mailbox: nothing (the default), add a label (and which label name), mark as read, or archive. Save the choice. The member can change it later.
4. **Spam.** Removes the email from the dashboard and marks it as spam in the mailbox. Confirm the first time the member uses it ("This also marks it as spam in your mailbox. OK?"), save that the confirm was given, and do not ask again. Offer an Undo for a few seconds.

## Undo for No reply needed and Spam
Hold the mailbox action for a few seconds (for example 8 seconds) after the click and show an "Undo" button with a countdown. If the member clicks Undo, cancel the action and put the email back on the dashboard. If the countdown ends, run the mailbox action. This is safer than reversing an action afterward.

## Dismissals and settings
- "No reply needed" and "Spam" remove the email from the dashboard for good (until a new message arrives in the thread). Keep the list of dismissed thread IDs in the dashboard's own data store, not in Notion, because it is display state, not business data.
- The email button settings (the no-reply action, the label name, the spam confirm, the always-show and always-hide sender lists) are saved on the Dashboards entry.

## Texting from the dashboard
A text reply (for example from the CRM or Slack widgets where a text is possible) needs the same gate every time, before any text is drafted or sent:
1. Consent: read the member's `consent_source` on the CRM Map, and the contact's record (a form submission, a tag, or a field). Unknown means no text.
2. Not do-not-disturb, not unsubscribed, not marked STOP.
3. Inside 8am to 9pm in the person's own time zone.
If it fails, do not show a text option, and offer an email or a call instead, with the reason in one line.

## Never
Never send, label, archive, or mark as spam without the member's click. Never read or show mail the member did not connect the dashboard to see. Never show full message bodies beyond what the widget needs (a short preview). Never keep message text in Notion unless the member makes a task that links to it.
