# My Name is URL

URL checking as a service.  A hack in progress.

I know it isn't efficient yet.  That's not the point right now.  

I want a very simple way of asking if a url is up or not.  This is decoupled from service definitions.  Just tell me if it works.

The client passes a JSON message to a specifc redis list.  The message include the url to be checked along with another redis list to reply to with the result.

The worker... does the work.  You can have LOTS of them.

This should utlimately be expanded to include different URL / Service types (tcp, redis, icmp?, etc).

More updates coming!

Run it like so:

```bash
bundle exec foreman start client=8,worker=8
```