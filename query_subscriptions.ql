query Subscriptions {
  subscriptions (
    #first: 3
  ) {
    id
    space {
      id
      name
    }
  }
}
