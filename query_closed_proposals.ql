query Proposals {
  proposals (
    first: 20,
    skip: 0,
    where: {
      # space_in: ["bdudao.eth", "carbinocapital.eth"],
      # space_in: ["bdudao.eth"],
      space_in: ["enabel.eth"],
      # state: "closed" # todo: only closed/finished
      # scores_state_in: ["final"]
    },
    orderBy: "created",
    orderDirection: desc
  ) {
    # id
    # space {
    #   id
    # }
    type
    title
    choices
    scores_total
    scores_state
    scores_updated
    scores_by_strategy
    votes
    scores
  }
}
