import string

import vim


def math():
    return vim.eval('vimtex#syntax#in_mathzone()') == '1'


def comment():
    return vim.eval('vimtex#syntax#in_comment()') == '1'


def env(name):
    x, y = vim.eval("vimtex#env#is_inside('" + name + "')")
    return x != '0' and y != '0'


def add_row(snip):
    row_len = int(''.join(s for s in snip.buffer[snip.line] if s.isdigit()))
    old_spacing = snip.buffer[snip.line][:snip.buffer[snip.line].rfind('\t') + 1]
    snip.buffer[snip.line] = ''
    final_str = old_spacing
    final_str += " & ".join(['$' + str(j + 1) for j in range(row_len)])
    final_str += " \\\\\\"
    snip.expand_anon(final_str)


def create_matrix(snip, env="matrix"):
    rows = snip.buffer[snip.line].split('x')[0]
    cols = snip.buffer[snip.line].split('x')[1]
    int_val = lambda string: int(''.join(s for s in string if s.isdigit()))
    rows = int_val(rows)
    cols = int_val(cols)
    offset = cols + 1
    old_spacing = snip.buffer[snip.line][:snip.buffer[snip.line].rfind('\t') + 1]
    snip.buffer[snip.line] = ''
    final_str = old_spacing + "\\begin{" + env + "}\n"
    for i in range(rows):
        final_str += old_spacing + '\t'
        final_str += " & ".join(['$' + str(i * cols + j + offset) for j in range(cols)])
        final_str += " \\\\\\\n"
    final_str += old_spacing + "\\end{" + env + "}$0"
    snip.expand_anon(final_str)


def create_table(snip, env="tabular"):
    rows = snip.buffer[snip.line].split('x')[0]
    cols = snip.buffer[snip.line].split('x')[1]
    int_val = lambda string: int(''.join(s for s in string if s.isdigit()))
    rows = int_val(rows)
    cols = int_val(cols)
    offset = cols + 1
    old_spacing = snip.buffer[snip.line][:snip.buffer[snip.line].rfind('\t') + 1]
    snip.buffer[snip.line] = ''
    final_str = old_spacing + "\\begin{" + env + "}{|" + "|".join(['$' + str(i + 1) for i in range(cols)]) + "|}\n"
    for i in range(rows):
        final_str += old_spacing + '\t'
        final_str += " & ".join(['$' + str(i * cols + j + offset) for j in range(cols)])
        final_str += " \\\\\\\n"
    final_str += old_spacing + "\\end{" + env + "}" + "\n" * (env == "tabular") + "$0"
    snip.expand_anon(final_str)


def _parse_comments(s):
    """ Parses vim's comments option to extract comment format """
    i = iter(s.split(","))

    rv = []
    try:
        while True:
            # get the flags and text of a comment part
            flags, text = next(i).split(':', 1)

            if len(flags) == 0:
                rv.append(('OTHER', text, text, text, ""))
            # parse 3-part comment, but ignore those with O flag
            elif 's' in flags and 'O' not in flags:
                ctriple = ["TRIPLE"]
                indent = ""

                if flags[-1] in string.digits:
                    indent = " " * int(flags[-1])
                ctriple.append(text)

                flags, text = next(i).split(':', 1)
                assert flags[0] == 'm'
                ctriple.append(text)

                flags, text = next(i).split(':', 1)
                assert flags[0] == 'e'
                ctriple.append(text)
                ctriple.append(indent)

                rv.append(ctriple)
            elif 'b' in flags:
                if len(text) == 1:
                    rv.insert(0, ("SINGLE_CHAR", text, text, text, ""))
    except StopIteration:
        return rv


def get_comment_format():
    """ Returns a 4-element tuple (first_line, middle_lines, end_line, indent)
    representing the comment format for the current file.

    It first looks at the 'commentstring', if that ends with %s, it uses that.
    Otherwise it parses '&comments' and prefers single character comment
    markers if there are any.
    """
    commentstring = vim.eval("&commentstring")
    if commentstring.endswith("%s"):
        c = commentstring[:-2]
        return (c.rstrip(), c.rstrip(), c.rstrip(), "")
    comments = _parse_comments(vim.eval("&comments"))
    for c in comments:
        if c[0] == "SINGLE_CHAR":
            return c[1:]
    return comments[0][1:]
