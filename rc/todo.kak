provide-module todo %{
    define-command todo-toggle %{
        try %{
            # mark complete
            execute-keys -itersel -draft "<a-x><a-_><a-:><a-s>s(?i)-\s\[\s\]<ret><a-i>[rx"
        } catch %{
            # remove checkbox
            execute-keys -itersel -draft "<a-x><a-_><a-:><a-s>s(?i)-\s\[.\]\s+<ret>c-<space><esc>"
        } catch %{
            # mark incomplete
            execute-keys -itersel -draft "<a-x><a-_><a-:><a-s>s(?i)-\s\[x\]<ret><a-i>[r<space>"
        } catch %{
            # add checkbox
            execute-keys -itersel -draft "<a-x><a-_><a-:><a-s>s-\s+<ret>a[<space>]<space><esc>"
        } catch %{
            # looks like we're not on a list item
            echo -markup "{Information}todo-toggle: not on a list item"
        }
    } -docstring 'toggle todo checkbox'
}
