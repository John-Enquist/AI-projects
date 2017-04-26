# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()


def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first.
    """
    from game import Directions
    frontier = util.Stack()
    frontier.push((problem.getStartState(),[],0))
    explored = []
    while not frontier.isEmpty():
        state, moves, cost = frontier.pop()
        if problem.isGoalState(state):
            return moves
        explored += [state]
        children = problem.getSuccessors(state)
        for child in children:
            if not child[0] in explored:
                frontier.push((child[0], moves+[child[1]], cost+child[2]))
    return "cannot reach"

def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    from game import Directions
    frontier = util.Queue()
    frontier.push((problem.getStartState(),[],0))
    explored = []
    while not frontier.isEmpty():
        state, moves, cost = frontier.pop()
        if problem.isGoalState(state):
            return moves
        if state not in explored:
            explored += [state]
        for child in problem.getSuccessors(state):
            if child[0] not in explored:
                frontier.push((child[0], moves+[child[1]], cost+child[2]))
                explored += [child[0]]
    return "cannot reach"

def uniformCostSearch(problem):
    """Search the node of least total cost first."""
    from game import Directions
    start = problem.getStartState()
    frontier = util.PriorityQueue()
    frontier.push((problem.getStartState(),[],0), 0)
    explored = [start]
    while not frontier.isEmpty():
        state, moves, cost = frontier.pop()
        if problem.isGoalState(state):
            return moves
        for child in problem.getSuccessors(state):
            if child[0] in explored:
                if problem.isGoalState(child[0]):
                    return moves+[child[1]]
            else:
                explored += [child[0]]
                frontier.push((child[0], moves+[child[1]], cost+child[2]), cost+child[2])
    return "cannot reach"

 
def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    from game import Directions
    start = problem.getStartState()
    frontier = util.PriorityQueue()
    frontier.push((problem.getStartState(),[],0), 0)
    explored = [start]
    while not frontier.isEmpty():
        state, moves, cost = frontier.pop()
        if problem.isGoalState(state):
            return moves
        for child in problem.getSuccessors(state):
            if child[0] in explored:
                if problem.isGoalState(child[0]):
                    return moves+[child[1]]
            else:
                heur = heuristic(child[0], problem)
                frontier.push((child[0], moves+[child[1]], cost+child[2]), cost+child[2]+heur)
                explored += [child[0]];
    return "cannot reach"
# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
