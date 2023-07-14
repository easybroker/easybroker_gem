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
* **Breaking change**: `limit`, `page`, and `search` params should be at the root level requests instead of in the `query` hash.
* Updated endpoints to use the `api` subdomain; `api.easybroker.com/v1` instead of `www.easybroker.com/api/v1`.

## 1.0.1
* Added support for agencies, agents, properties and property_integrations endpoints for integration partners.

## 1.0.2
* Added support to configure the country code header for integration partners endpoints.

## 1.0.3
* Update httparty dependency from 0.18 to 0.21
