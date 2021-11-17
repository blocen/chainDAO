query Proposals {
  proposals (
    first: 20,
    skip: 0,
    where: {
      space_in: ["ens.eth", "carbinocapital.eth"],
      #space_in: ["carbinocapital.eth"],
      state: "" # todo: only closed/finished
    },
    orderBy: "created",
    orderDirection: desc
  ) {
    id
    space {
      id
    }
    title
    scores
    #scores_state
    #scores_total
    #scores_updated
    #scores_by_strategy
    #body
    choices
    #snapshot
    #state
  }
}
