query Proposal {
  proposal (id:"0x4f89a6315711350544c14e7c2b13a727f3dbf5936e3fa2f5fd4e851f11267f60") {
    scores
    scores_by_strategy
    scores_state
    scores_total
    scores_updated
    votes
    
  }
}

query Proposal_ {
  proposal(id:"QmWbpCtwdLzxuLKnMW4Vv4MPFd2pdPX71YBKPasfZxqLUS") {
    id
    title
    
    choices
    start
    end
    snapshot
    state
    author
    votes
    scores
    space {
      id
      name
    }
  }
}
