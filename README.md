# todo.kak

Toggle checkboxes in Kakoune.

## Installation

Add [`todo.kak`](rc/todo.kak) to your autoload or source it manually.

## Suggested configuration

```kak
hook global WinSetOption filetype=markdown %{
    require-module todo
    add-highlighter buffer/ regex '\[ \]' 0:blue
    add-highlighter buffer/ regex '\[x\]' 0:comment
    map buffer normal <ret> ': todo-toggle<ret>' -docstring "toggle checkbox"
}
```
