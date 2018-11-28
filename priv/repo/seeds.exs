# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InputsForExample.Repo.insert!(%InputsForExample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias InputsForExample.Example

parent = InputsForExample.Repo.insert!(%Example.Parent{})

child_1 = InputsForExample.Repo.insert!(%Example.Child{name: "Child 1"})
child_2 = InputsForExample.Repo.insert!(%Example.Child{name: "Child 2"})
InputsForExample.Repo.insert!(%Example.Child{name: "Child 3"})
InputsForExample.Repo.insert!(%Example.Child{name: "Child 4"})

InputsForExample.Repo.insert!(%Example.Intermediate{parent_id: parent.id, child_id: child_1.id})
InputsForExample.Repo.insert!(%Example.Intermediate{parent_id: parent.id, child_id: child_2.id})
