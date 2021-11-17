query Votes {
  votes (
    first: 10
    where: {
      #proposal_in: [],
      #space_in: ["ens.eth", "carbinocapital.eth"]
    }
  ) {
    #id
    #voter
    created
    choice
    #vp_state
    proposal {
      #id
      title
    }
    space {
      id
    }
  }
}
