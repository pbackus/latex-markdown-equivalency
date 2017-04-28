Markdown Equivalency in LaTeX
=============================

Introduction
------------

[LaTeX][1] is an extremely powerful and flexible markup language that many
people find difficult to learn. [Markdown][2], in contrast, is an extremely
rudimentary markup language that most people find very easy to learn. This
article aims to bridge the gap between the two by showing how a subset of
LaTeX's features can be used to emulate Markdown. Since the simple formatting
constructs Markdown provides are sufficient (or nearly so) for a large class of
non-technical documents, learning their LaTeX equivalents is a good place for
LaTeX beginners to start.

[1]: https://www.latex-project.org/
[2]: https://daringfireball.net/projects/markdown/

The examples below will follow more or less the same structure as John Gruber's
original [Markdown Basics](https://daringfireball.net/projects/markdown/basics)
tutorial. In addition, both the Markdown source for this article and its
translation into LaTeX will be available for download. (TODO: add link.)

Basic LaTeX Syntax
------------------

Before we dive in, it's worth knowing a few very basic things about how LaTeX
documents are written.

### Document Structure

A LaTeX document has two major sections: the **preamble**, and the **document
body**. They're somewhat analagous to the `<head>` and `<body>` sections in
HTML. Here's a minimal LaTeX "hello world," with the sections indicated using
comments:

    \documentclass{article}
    
    % This part is the preamble.

    \begin{document}
    %This part is the body.
    Hello, world!
    \end{document}

The preamble is used for things that affect the document as a whole: package
imports, definitions of custom macros, adjustments to the default margins,
typeface, font size, and so forth. The body is where the actual text of your
document goes, including any formatting markup. As you may have surmised, the
`%` character marks the start of a comment; any text between it and the end of
the line will be ignored.

You can use the example above as a starting point for your own documents, if
you wish; however, some of LaTeX's default settings are a bit strange. I myself
prefer the following minimal preamble, which I'll be using in this article's
LaTeX translation:

    % Tell LaTeX to treat the file as UTF-8 instead of ASCII
    \usepackage[utf8]{inputenc}
    % Include space between paragraphs
    \usepackage{parskip}
    % Override LaTeX's huge default margins with something more reasonable
    \usepackage[margin=1in]{geometry}

### Macros

**Macros**, sometimes also called commands, are what you use to mark up your
document. LaTeX macros always start with a backslash (`\`), and have three
parts, which must appear in the following order:

1. The name of the macro. It can't include spaces, but *can* include
   punctuation characters.
2. Zero or more optional arguments, each enclosed in square brackets (`[]`).
3. Zero or more required arguments, each enclosed in curly braces (`{}`).

The macro `\usepackage[margin=1in]{geometry}` from the example preamble above
uses all three parts.

### Special Characters

The following ten characters have special meanings in LaTeX:

> `&`, `%`, `$`, `#`, `_`, `{`, `}`, `~`, `^`, `\`

If you would like any of these characters to appear in your document, use the
following macros:

> `\&`, `\%`, `\$`, `\#`, `\_`, `\{`, `\}`, `\textasciitilde`,
> `\textasciicircum^`, `\textbackslash`

Markdown Basics in LaTeX
------------------------

### Paragraphs, Headers, and Block Quotes

Paragraphs in LaTeX are separated by blank lines, just like they are in
Markdown. Also like Markdown, LaTeX will completely ignore your line breaks by
default; if you want to force a line break, use the `\\` macro.

For first, second, and third-level headers, LaTeX provides `\section{...}`,
`\subsection{...}`, and `\subsubsection{...}` macros. By default, sections in a
LaTeX document are numbered. If you don't want numbers, you can disable them
for a given header by adding a `*` to the end of the macro's name; e.g.,
`\section*{...}`.

Block quotes in LaTeX are formatted using the `quote` environment. An
**environment** is a region of the document delimited by a matching pair of
`\begin{...}` and `\end{...}` macros. Environments are a very common construct
in LaTeX, used for everything from quotes, to equations, to tables.

Here's an example Markdown document:

    A First Level Header
    ====================
    
    A Second Level Header
    ---------------------
    
    Now is the time for all good men to come to
    the aid of their country. This is just a
    regular paragraph.
    
    The quick brown fox jumped over the lazy
    dog's back.
    
    ### Header 3
    
    > This is a blockquote.
    > 
    > This is the second paragraph in the blockquote.
    >
    > ## This is an H2 in a blockquote

...and here's the equivalent in LaTeX:

    \section*{A First Level Header}
    
    \subsection*{A Second Level Header}
    
    Now is the time for all good men to come to
    the aid of their country. This is just a
    regular paragraph.
    
    The quick brown fox jumped over the lazy
    dog's back.
    
    \subsubsection*{Header 3}
    
    \begin{quote}
    This is a blockquote.
    
    This is the second paragraph in the blockquote.
    
    \subsection*{This is an H2 in a blockquote}
    \end{quote}

### Phrase Emphasis

The LaTeX `\emph{...}` macro is equivalent to surrounding text with a single
pair of asterisks or underscores in Markdown. It defaults to italic when the
surrounding text is straight, and straight when the surrounding text is italic.

There is no direct equivalent in LaTeX for "strong emphasis" (double
asterisks/underscores in Markdown), but you can use the `\textbf{...}` macro to
create bold text.

In Markdown:

    Some of these words _are emphasized_.

    Some of these words are **strongly emphasized**.

In LaTeX:

    Some of these words \emph{are emphasized}.

    Some of these words are \textbf{strongly emphasized}.

### Lists

Unordered lists in LaTeX are created using the `itemize` environment. Each new
item in the list should begin with the macro `\item`.

In Markdown:

     * Harder
     * Better
     * Faster
     * Stronger

In LaTeX:

    \begin{itemize}
    \item Harder
    \item Better
    \item Faster
    \item Stronger
    \end{itemize}

Ordered lists are almost exactly the same, except that they use the `enumerate`
environment instead.

In Markdown:

     1. Lions
     2. Tigers
     3. Bears, oh my!

In LaTeX:

    \begin{enumerate}
    \item Lions
    \item Tigers
    \item Bears, oh my!
    \end{enumerate}

If there are multiple paragraphs following a single `\item` macro, they are all
considered part of the same item.

In Markdown:

     *   A list item.

         With multiple paragraphs.

     *   Another item in the list.

In LaTeX:

    \begin{itemize}
    \item A list item.

    With multiple paragraphs.

    \item Another item in the list.
    \end{itemize}

### Links

Since LaTeX was designed first and foremost as a language for typesetting
_printed_ documents, it does not have built-in support for hyperlinks. They
can, however, be created using macros from the `hyperref` package.

To use the package in your document, you must add the following macro to the
preamble:

    \usepackage{hyperref}

Then, in the document body, you can create a hyperlink with the macro
`\href{<url>}{<text>}`.

In Markdown:

    This is an [example link](http://example.com).

In LaTeX:

    This is an \href{http://example.com}{example link}.

The `hyperref` package also includes a `\url{...}` macro, which works the same way
as Markdown's automatic links.

In Markdown:

    <http://example.com>

In LaTeX:

    \url{http://example.com}

LaTeX has no equivalent to Markdown's reference-style links.

### Images

To include images in a LaTeX document, you need to use the `graphicx` package.
First, add the following macro to the preamble:

    \usepackage{graphicx}

Then, in the document body, use the macro `\includegraphics{<filename>}`.

In Markdown:

    ![alt text](path/to/image.jpg)

In LaTeX:

    \includegraphics{path/to/image.jpg}

As with links, LaTeX has no equivalent to Markdown's reference-style images.

### Code

Code blocks in LaTeX use the `verbatim` environment.

In Markdown:

    Here we see the classic C "hello world":

        #include <stdio.h>

        int main(void) {
            printf("Hello, world!");
        }

In LaTeX:

    Here we see the classic C "hello world":

    \begin{verbatim}
    #include <stdio.h>

    int main(void) {
        printf("Hello, world!");
    }
    \end{verbatim}

Inline code is a little bit tricker. It's created using the `\verb` macro,
which has a unique way of handling its argument: the character immediately
following `\verb` is taken to be the delimiter, and everything from there until
that character's _next_ occurrence is formatted as code.

In Markdown:

    I strongly recommend against using any `<blink>` tags.

In LaTeX:

    I strongly recommend against using any \verb`<blink>` tags.

Naturally, the delimiter can't appear in the code itself. Markdown lets you use
multiple backticks to avoid this; in LaTeX, just choose a different delimiter.

In Markdown:

    ``There is a literal backtick (`) here.``

In LaTeX:

    \verb|There is a literal backtick (`) here.|
