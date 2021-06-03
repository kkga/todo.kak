provide-module todo %{
    define-command todo-toggle %{
        try %{
            # mark complete
            execute-keys -draft "<esc><space>;xs(?i)-\s\[\s\]<ret><a-i>[rx"
        } catch %{
            # remove checkbox
            execute-keys -draft "<esc><space>;xs(?i)-\s\[.\]\s+<ret>c-<space><esc>"
        } catch %{
            # mark incomplete
            execute-keys -draft "<esc><space>;xs(?i)-\s\[x\]<ret><a-i>[r<space>"
        } catch %{
            # add checkbox
            execute-keys -draft "<esc><space>;xs-\s+<ret>a[<space>]<space><esc>"
        } catch %{
            echo -markup "{Information}todo-toggle: not on a list item"
        }
    } -docstring 'toggle todo checkbox'
}
