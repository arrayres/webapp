React = require 'react'

NavLogo = require './logo/logo'
NavTabs = require './tabs/tabs'
NavLegal = require './legal/legal'

# Main navigation component:
module.exports = React.createClass
  render: ->
    <nav className="app-nav">
      <NavLogo/>
      <NavTabs/>
      <NavLegal/>
    </nav>
