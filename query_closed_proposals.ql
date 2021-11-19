query Proposals {
  proposals (
    first: 20,
    skip: 0,
    where: {
      space_in: ["bdudao.eth", "carbinocapital.eth"],
      #space_in: ["carbinocapital.eth"],
      state: "closed" # todo: only closed/finished
      type_in: ["single-choice", "basic"]
    },
    orderBy: "created",
    orderDirection: desc
  ) {
    id
    space {
      id
    }
    type
    space
    title
    choices
    scores
  }
}
