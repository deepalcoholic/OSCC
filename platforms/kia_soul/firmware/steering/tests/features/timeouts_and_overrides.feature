# language: en

Feature: Timeouts and overrides

  If the module doesn't hear from the controller after an amount of time,
  or the operator manually actuates the steering wheel, control should be
  disabled.


  Scenario: Controller command timeout
    Given steering control is enabled

    When the time since the last received controller command exceeds the timeout

    Then control should be disabled


  Scenario: Chassis State 1 report timeout
    Given steering control is enabled

    When the time since the last received Chassis State 1 report exceeds the timeout

    Then control should be disabled


  Scenario Outline: Operator override
    Given steering control is enabled

    When the operator applies <sensor_val> to the steering wheel

    Then control should be disabled
    And override flag should be set

    Examples:
      | sensor_val |
      |  800       |
      |  1024      |
      |  2048      |
      |  4096      |
