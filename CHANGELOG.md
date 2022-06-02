# Changelog

## 0.1.1
* Initial release.

## 0.1.2
* Added support for contact_requests, mls_properties and locations endpoints.

## 0.1.3
* Fixed pagination bug where the last page may not have been included.

## 0.1.4
* Added support for the listing_statuses endpoint.

## 1.0.0
* **Breaking change**: Everytime you make a request `limit`, `page` and `search` no longer should be wrapped inside a `query` key.
* Since making requests to `www.easybroker.com/api/v1` always redirects to the api subdomain, we updated the root URLs to avoid these redirections.Up
