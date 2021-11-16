query Proposals {
  proposals (
    first: 20,
    skip: 0,
    where: {
      #space_in: ["ens.eth", "carbinocapital.eth"],
      state: "closed"
    },
    orderBy: "created",
    orderDirection: desc
  ) {
    id
    title
    #body
    choices
    start
    end
    snapshot
    state
    author
    space {
      id
      name
    }
  }
}
