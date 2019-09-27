# README

A test task for Grinteq. 

## Task

A client needs to know what is happening on the social networks.
The three social networks the client is interested in are:
 * https://takehome.io/twitter
 * https://takehome.io/facebook
 * https://takehome.io/instagram

The client needs get back a JSON response of the output from the three social networks in the format:

{ twitter: [tweets], facebook: [statuses], instagram: [photos] }

## Solution description

Each social network response is cached with a defined TTL. I rely on 'race_condition_ttl' option to make Rails update invalidated cache in the background, while showing stale data during update process.
This approach helps to handle high load and fix the following issues:

* Unnecessary requests to the social networks - only one request per cache TTL is made to each social network.
* Erroneous responses - Client will see stale data until the next cache invalidation.*

Drawbacks:

* Clients receive stale data during the cache update.
* Clients receive stale data till the next cache invalidation in case of erroneous response from the social networks.

*Rails will skip nil caching only on some of cache driver implementations, like Memcached.


## Tests

Run rspec to check the code.

## What can be improved
* Store cache in redis or Memcached.
* Move the requests to Social Networks to a background job to fix the first slow response when cache is invalidated.
* A backgorund job may utilise threads to make cache updates faster.
* Add a retry logic to fix erroneous responses.

