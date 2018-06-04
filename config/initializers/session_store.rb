Rails.application.config.session_store :cookie_store, key: '_report-_session'
Rails.application.config.session_store :cookie_store, expire_after: 14.days
