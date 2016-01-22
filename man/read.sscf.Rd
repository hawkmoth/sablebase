\name{read.sscf}
\alias{read.sscf}
\alias{ExpeData file format}

\title{Load ExpeData's SSCF files}
\description{Reads in data in SSCF format. SSCF is a format used by
  Sable System Internationals ExpeData data acquisition and analysis
  software. All sub versions (plain vs. extended format) are supported.}

\usage{read.sscf(filename)}
\arguments{
  \item{filename}{The file to be read in.}
}

\details{
  After loading, the files contents are postprocessed to make them
  easier to use in R. This includes, among others, using channel names
  as the column names of the data matrix, conversion of markers to
  characters and merging of the split remarks.
}

\value{
  The result is an object of class SSCFFile, basically a multivariate
  timeseries object (?mts) of the file data. Utility functions have
  been defined, which make access to the data straight forward (see
  examples below).

  Additional information about the file (metadata) is available as attributes, which
  can be read via 'attr(x, attrname)'. The following attributes are defined:

  \item{version}{The SSCF version of the file. Current is 1.02}
  \item{nchannel}{Number of channels.}
  \item{nsample}{Number of samples per channel.}
  \item{comment}{Comments embedded in the file.}
  \item{marker}{A table of marker positions and values.}
  \item{channelinfo}{A list of additional information for each
    channel. The list elements are named after the channel, making named
  access possible, i.e. attr(x, "channelinfo")$O2_A. For details of the
  available information see below.}
  \item{uservar}{A list of defined user variables. Name base list
    access may be used,  i.e. attr(x. "uservar")$foo, especially when variable
  aliases were defined. By default the user variables are named K1..K50.}
  \item{setup}{Path to setup configuration file.}
  \item{raw}{If debug mode is turned on (with options(debug=TRUE) on the
    R prompt), the raw header and footer data from the file will
    additionally be provided. If you are writing code using this field,
    always check for debug mode or the existence of this field.}

  The channelinfo list contains the following fields per
  channel:
  \item{title}{Name of the channel}
  \item{units}{Units of measurement, currently unused by ExpeData}
  \item{instrument}{The instrument the channel data was aquired with.}
  \item{add.1}{Auxiliary data field 1. (currently unused)}
  \item{add.2}{Auxiliary data field 2. (currently unused)}
  \item{tnum}{Transformation number of the channel (consult the ExpeData
  manual for details.)}
  \item{color}{Color to be used for plotting the channel}
  \item{aux}{Vector of 31 auxiliary values for the channel. This may
  contain calibration values etc. However, no standard interpretation is
  defined.}
}

\seealso{
  Attribute access via 'attr', 'attributes'.

  'summary'
}

\examples{
f = read.sscf("filename")
# Basic file information
summary(f)

# Data access based on channel names
plot(f$O2_A)
mean(f$BP_A)

# Metadata as attributes
attributes(f)
attr(f, "uservar")
attr(f, "uservar")$K3
attr(f, "channelinfo")$O2_A

}

% Help page author
\author{Thomas Foerster \email{foerster@sablesys.com}}
