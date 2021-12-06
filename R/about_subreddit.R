#' Metadata about a specific subreddit
#'
#' Extract subreddit metadata.
#'
#' @param subreddits A vector of strings representing the subreddits of interest
#'
#' @return a list of lists with subreddit metadata
#'
#' @examples
#' \dontrun{
#' about_subreddit(subreddit="cats")
#' }
#' @export
about_subreddit <- function(subreddits)
  sapply(subreddits, about_single_subreddit, simplify = FALSE, USE.NAMES = TRUE)

about_single_subreddit <- function(subreddit)
  (build_about_url(subreddit) |> url_to_json())$data


# Build a URL string to the subreddit about page
build_about_url <- function(subreddit)
  build_base_request_url(subreddit) %+% "about.json"

