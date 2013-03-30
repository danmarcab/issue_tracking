# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create([{ code: "WFSR", name: "Waiting for Staff Response", category: "Open" },
               { code: "WFC", name: "Waiting for Customer", category: "Open" },
               { code: "HOLD", name: "On Hold", category: "Hold" },
               { code: "CANC", name: "Cancelled", category: "Closed" },
               { code: "COMP", name: "Completed", category: "Closed" }])

Department.create([{ name: "Sales" }, { name: "Billing" }, { name: "Support" }])