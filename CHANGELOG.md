# Changelog

## 0.1.1
* Initial release.

## 0.1.2
* Added support for contact_requests, mls_properties and locations endpoints.

## 0.1.3
* Fixed pagination bug where the last page may not have been included.

## 0.1.4
* Added support for the listing_statuses endpoint.

## 0.1.5
* Added support for the listing_statuses endpoint for integration partners.

## 1.0.0
* **Breaking change**: Everytime you make a request `limit`, `page` and `search` no longer should be wrapped inside a `query` key.
* Updated endpoints to use the `api` subdomain; `api.easybroker.com/v1` instead of `www.easybroker.com/api/v1`.
