# My Name is URL

URL checking as a service.  A hack in progress.

I know it isn't efficient yet.  That's not the point right now.  

I'm tired of having to define messy monitoring checks for each url type I want to monitor.  Instead, I want a single, normalized way of doing so.

The client passes a JSON message to a specifc redis list.  The message include the url to be checked along with another redis list to reply to with the result.

The worker... does the work.

This should utlimately be expanded to include different URL / Service types (tcp, redis, icmp?, etc).

More updates coming!

Run it like so:

```bash
bundle exec foreman start client=8,worker=8
```