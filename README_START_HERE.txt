SIBI SPORTS CLUB — FINAL CLIENT UPDATE
======================================

This package contains the updated Sibi Sports Club website + admin workspace.

WHAT IS INCLUDED
----------------
- Sibi Sports Club branding and supplied 3D circular logo
- Workout background in the hero
- Sticky public navigation
- Hero shimmer animation
- Slow, contained services carousel (no page-wide horizontal movement)
- Corrected membership/package pricing from the latest client package images
- Membership/package CTAs route to the internal enquiry form
- Personal Training and Cardio kept as separate packages
- Trainer grid with Transform + Opacity animation
- 9 review cards with 3 visible per desktop page
- Contact hover/flash interaction
- Responsive layouts with horizontal overflow prevented
- Admin members, payments, enquiries, trainers and messaging workflows
- Scrollable recipients list for large audiences
- Recipient removal controls
- Fresh Add Member form every time it opens
- Payment save + member refresh
- Template library with a balanced professional layout
- Styled file uploads
- Admin login integrated into the Sibi website shell

ADMIN CREDENTIALS
-----------------
Email: admin@elevate.local
Password: admin@2026

WINDOWS START
-------------
Double-click START_WINDOWS.cmd in the main Sibi_Sports_Club_FINAL folder. It checks for Node.js, prepares dependencies, starts the server, and opens the website in your browser. Keep the black command window open while using the site.

If Node.js is missing, the launcher opens https://nodejs.org/ so you can install the LTS version.

Website address: http://localhost:3000

The start script sets:
ADMIN_NAME=Administrator
ADMIN_EMAIL=admin@elevate.local
ADMIN_PASSWORD=admin@2026
SESSION_SECRET=ElevateGym_2026_RandomSecret_8392_Xk7pLmQ5
APP_TIMEZONE=Asia/Kolkata

IMPORTANT
---------
Do not expose the admin password or SESSION_SECRET publicly in production.
For deployment, replace them with production secrets.

WHATSAPP MESSAGE DELIVERY SETUP
-------------------------------
The messaging workspace now distinguishes actual provider acceptance from saved/scheduled messages.
Real sending requires Meta WhatsApp Cloud API credentials; the website cannot send WhatsApp messages using only a phone number.

1. Copy Admin\.env.example to Admin\.env (or set the same environment variables in your hosting provider).
2. Set WHATSAPP_ACCESS_TOKEN to a valid, server-side Meta WhatsApp Cloud API access token.
3. Set WHATSAPP_PHONE_NUMBER_ID to the sending phone-number ID from Meta WhatsApp Manager.
4. Optionally set WHATSAPP_GRAPH_VERSION to a currently supported Graph API version.
5. Restart the server.
6. Send a test message to a consenting test recipient first.

Manual delivery:
- Select members and send. The server calls WhatsApp Cloud API for each selected recipient.
- Delivery history shows Sent only when the API accepts a message. Failed/Pending rows show errors and provide Retry.
- WhatsApp rules apply: recipients must have opted in, and outside the customer-service window an approved WhatsApp message template may be required. The current implementation sends text/image messages and surfaces provider errors; approved-template API support may be needed for outbound marketing/renewal campaigns outside the 24-hour window.

Scheduled delivery:
- Choose a future date and time. The app worker checks for due messages every 15 seconds while the Node server is running.
- Keep the app process running continuously (use a process manager such as PM2 or your hosting platform's always-on service). For multiple server instances, move scheduling to a single worker/queue before scaling.
- Failed deliveries remain visible in the admin history and can be retried after the underlying issue is fixed.

Never commit Admin\.env or share the access token. If credentials are not configured, the app will not falsely report messages as sent.
