## What type of PR is this? (check all applicable)
- [ ] 🍕 Created New Model
- [ ] 🎨 Enhanced Query
- [ ] 🐛 Bug Fix

Title: `Implement db Documentation`

### Description
This PR implements a new dbt model for dbt documentation. It includes the following changes:

- New dbt model: `models/mart/fct_shopify_orders.sql` `models/descriptions/__overview__.md`
- Updates to `*.yml` to include the test
- New unit tests has been added to the model
- Documentation updates in `models/descriptions/__overview__.md`

### Key Changes
1. Deleted the dimension tables and refactored the fact tables.
2. Removed all aggregations from the utm_campaign_performance table
3. Deduplicate on the utm_campaign_performance to drop duplicate records
4. Updated project configuration to include the new model in our nightly run

### Dependencies
- No dependencies at the moment

### Testing
- Verified results against manual calculations for a sample period

### Documentation
- Updated `models/descriptions/__overview__.md` with details on the calculation methodology

### Deployment Notes
This change will be included in the next nightly dbt run. Please monitor the MoreDemand dashboard for any unexpected changes.

---

## Checklist for Reviewers
- [ ] 👍 SQL logic is correct and efficient
- [ ] 🙅‍♂️ Unit tests cover edge cases
- [ ] 📜 Documentation is clear and complete
- [ ] 🎨 Changes align with our data modeling standards
- [ ] 📊 No unintended impacts on existing models or dashboards