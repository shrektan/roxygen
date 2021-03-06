% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collate.R
\name{update_collate}
\alias{update_collate}
\title{Update Collate field in DESCRIPTION.}
\usage{
update_collate(base_path)
}
\arguments{
\item{base_path}{Path to package directory.}
}
\description{
Topologically sort R files and record in Collate field. The topological
sort is based on the \code{@include} tag, which should specify the filenames
(space separated) that should be loaded before the current file. These are
typically necessary if you're using S4 or RC classes (because super classes
must be defined before subclasses).
}
\details{
If there are no \code{@include} tags, roxygen2 will leave collate as is.
This makes it easier to use roxygen2 with an existing collate directive,
but if you remove all your \code{@include} tags, you'll need to also
manually delete the collate field.

This is not a roclet because roclets need the values of objects in a package,
and those values can not be generated unless you've sourced the files,
and you can't source the files unless you know the correct order.
}
\examples{
#' `example-a.R', `example-b.R' and `example-c.R' reside
#' in the `example' directory, with dependencies
#' a -> {b, c}. This is `example-a.R'.
#' @include example-b.R
#' @include example-c.R
NULL

\dontrun{
  update_collate("my_package")
}
}

