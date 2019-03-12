// Copyright (C) Thorsten Thormaehlen, Marburg, 2013, All rights reserved
// Contact: www.thormae.de

// This software is written for educational (non-commercial) purpose. 
// There is no warranty or other guarantee of fitness for this software, 
// it is provided solely "as is". 

function PetrickMethod()
{
  this.problem;
  this.maxProblemSize = 100;
  this.solution;
  this.log = "";
  var that = this;
  
  this.test = function() {
    var andArray = new Array();
    var orArray;
    var monomA;
    var monomB;
    orArray = new Array();
    monomA = new Object(); // using objects ensures that (x and x) = x
    monomA[1] = 1;
    orArray.push(monomA);
    monomB = new Object();
    monomB[2] = 2;
    orArray.push(monomB);
    andArray.push(orArray);
    orArray = new Array();
    monomA = new Object();
    monomA[3] = 3;
    orArray.push(monomA);
    monomB = new Object();
    monomB[4] = 4;
    orArray.push(monomB);
    andArray.push(orArray);
    orArray = new Array();
    monomA = new Object();
    monomA[1] = 1;
    orArray.push(monomA);
    monomB = new Object();
    monomB[3] = 3;
    orArray.push(monomB);
    andArray.push(orArray);
    orArray = new Array();
    monomA = new Object();
    monomA[5] = 5;
    orArray.push(monomA);
    monomB = new Object();
    monomB[6] = 6;
    orArray.push(monomB);
    andArray.push(orArray);
    orArray = new Array();
    monomA = new Object();
    monomA[2] = 2;
    orArray.push(monomA);
    monomB = new Object();
    monomB[5] = 5;
    orArray.push(monomB);
    andArray.push(orArray);
    orArray = new Array();
    monomA = new Object();
    monomA[4] = 4;
    orArray.push(monomA);
    monomB = new Object();
    monomB[6] = 6;
    orArray.push(monomB);
    andArray.push(orArray);
    /*orArray = new Array();
     monomA = new Object(); 
     monomA[4] = 4;
     orArray.push(monomA);
     monomB = new Object();
     monomB[4] = 4;
     orArray.push(monomB);
     andArray.push(orArray);*/
    
    this.solve(andArray);
  };

  this.solve = function(eq) {

    this.problem = eq;
    this.log = "";
    
    //printEqnArray(eq);
    printEqnArrayFancy(eq);
    
    // multiply out
    var andArray = eq;
    var loopCounter = 0;
    while (andArray.length > 1) {
      var newAndArray = new Array();
      for (var i = 1; i < andArray.length; i += 2) {

        var orTermA = andArray[i - 1];
        var orTermB = andArray[i];
        var newOrArray = new Array();
        for (var a = 0; a < orTermA.length; a++) {
          for (var b = 0; b < orTermB.length; b++) {
            var monom1 = orTermA[a];
            var monom2 = orTermB[b];
            var resultingMonom = new Object();
            for (var m in monom1) {
              resultingMonom[monom1[m]] = monom1[m];
            }
            for (var n in monom2) {
              resultingMonom[monom2[n]] = monom2[n];
            }
            newOrArray.push(resultingMonom);
          }
        }

        newAndArray.push(newOrArray);
      }
      // if uneven copy last and-term
      if (andArray.length % 2 === 1) {
        newAndArray.push(andArray[andArray.length - 1]);
      }
      //printEqnArray(newAndArray);
      printEqnArrayFancy(newAndArray);
      
      andArray.length = 0;
      // simplify or-term
      for (var i = 0; i < newAndArray.length; i++) {
        var orTerm = newAndArray[i];
        var newOrTerm = simplifyOrTerm(orTerm);
        if (newOrTerm.length > 0) {
          andArray.push(newOrTerm);
        }
      }

      var problemSize = eqnArrayProblemSize(andArray);
      if (problemSize > this.maxProblemSize) {
        console.log("Error: The cyclic covering problem is too large to be solved with Petrick's method (increase maxProblemSize). Size=" + problemSize);
        return false;
      }
      
      //printEqnArray(andArray);
      printEqnArrayFancy(andArray);
      loopCounter++;
    }
    this.solution = andArray;
    return true;
  };

  function simplifyOrTerm(orTerm) {
    // find a monom that is the same or simpler than another one
    var newOrTerm = new Array();
    var markedForDeletion = new Object();
    for (var a = 0; a < orTerm.length; a++) {
      var keepA = true;
      var monomA = orTerm[a];
      for (var b = a + 1; b < orTerm.length && keepA; b++) {
        var monomB = orTerm[b];
        var overlapBoverA = 0;
        var lengthA = 0;
        for (var m in monomA) {
          if (monomB[m] in monomA) {
            overlapBoverA++;
          }
          lengthA++;
        }

        var overlapAoverB = 0;
        var lengthB = 0;
        for (var m in monomB) {
          if (monomA[m] in monomB) {
            overlapAoverB++;
          }
          lengthB++;
        }

        if (overlapBoverA === lengthB) {
          keepA = false;
        }

        if (lengthA < lengthB && overlapAoverB === lengthA) {
          markedForDeletion[b] = b;
        }

      }
      if (keepA) {
        if (a in markedForDeletion) {
          // do nothing
        } else
          newOrTerm.push(orTerm[a]);
      }
    }
    return newOrTerm;
  }


  function printEqnArrayFancy(andArray) {
    var str = "";
    for (var i = 0; i < andArray.length; i++) {
      var first = true;
      str += "(";
      var orArray = andArray[i];
      for (var j = 0; j < orArray.length; j++) {
        if (!first)
          str += " &or; ";
        var monom = orArray[j];
        for (var k in monom) {
          str += "<i>p</i><sub><small>"+ monom[k] + "</small></sub>";
        }
        first = false;
      }
      str += ")";
    }
    if(that.log.length > 0) {
      that.log += "<p>&hArr;&nbsp;" + str + "</p>";
    }else{
      that.log += "<p>"+ str + "</p>";
    }
  }
  
  function eqnArrayProblemSize(andArray) {
    var monomCounter = 0;
    for (var i = 0; i < andArray.length; i++) {
      var orArray = andArray[i];
      monomCounter += orArray.length;
    }
    return monomCounter;
  }
  
  
  function printEqnArray(andArray) {
    var str = "";
    for (var i = 0; i < andArray.length; i++) {
      var first = true;
      str += "(";
      var orArray = andArray[i];
      for (var j = 0; j < orArray.length; j++) {
        if (!first)
          str += " or ";
        var monom = orArray[j];
        for (var k in monom) {
          str += monom[k];
        }
        first = false;
      }
      str += ")";
    }
    console.log(str);
  }
  
}

function PrimTerm() {
  this.implicant = -1;
  this.termString = "";
  this.color = [0, 0, 0];
  this.coloredTermString = "";
  this.used = false;
  this.neededByVar = new Object;
}

function Implicant() {
  this.imp = new Object();
  this.isPrim = false;
  this.isOnlyDontCare = false;
  this.bitMask = 0;
}

function ImplicantGroup() {
  this.group = new Array;
  this.order = -1;
}

function PrimTermTable(ord) {
  this.essentialPrimTerms = new Array();
  this.order = ord;
  this.remainingVars =  new Array();;
  this.remainingPrimTerms =  new Array();
  this.supersededPrimTerms =  new Array();
}

function hsvToRgb(h, s, v) {

  var r, g, b;
  var i = Math.floor(h * 6);
  var f = h * 6 - i;
  var p = v * (1 - s);
  var q = v * (1 - f * s);
  var t = v * (1 - (1 - f) * s);

  switch (i % 6) {
  case 0:
    r = v, g = t, b = p;
    break;
  case 1:
    r = q, g = v, b = p;
    break;
  case 2:
    r = p, g = v, b = t;
    break;
  case 3:
    r = p, g = q, b = v;
    break;
  case 4:
    r = t, g = p, b = v;
    break;
  case 5:
    r = v, g = p, b = q;
    break;
  }

  return [ Math.floor(r * 255), Math.floor(g * 255), Math.floor(b * 255) ];
}

function QuineMcCluskeyDataCtrl() {
  this.noOfVars = -1;
  this.funcdata = new Array;
  this.primTerms = new Array;
  this.implicantGroups = new Array;
  this.minimalTerm = "";
  this.coloredMinimalTerm = "";
  this.minimalTermPrims = new Array;
  this.primTermTables = new Array;
  this.petrickSolver = new PetrickMethod();
  this.petrickTermPrims = new Array;
  this.allowDontCare = false;
  
  this.init = function(no) {
    this.noOfVars = no;
    this.funcdata.length = 0;
    this.primTerms.length = 0;
    this.implicantGroups.length = 0;
    this.minimalTerm = "0";
    this.coloredMinimalTerm = "0";
    this.minimalTermPrims.length = 0;
    this.primTermTables.length = 0;
    this.petrickTermPrims.length = 0;

    var noOfFuncData = Math.pow(2, this.noOfVars);
    for (var i = 0; i < noOfFuncData; i++) {
      this.funcdata.push(0);
    }
    
    //this.petrickSolver.test();
    
  };
  
  this.setFuncData = function(i, val) {
    if (i < 0 || i >= this.funcdata.length)
      return;
    this.funcdata[i] = val;
  };
  
  this.activated = function(i) {
    if (i < 0 || i >= this.funcdata.length)
      return;

    this.funcdata[i] += 1;
    if(this.allowDontCare) {
      if (this.funcdata[i] > 2) this.funcdata[i] = 0;
    }else{
      if (this.funcdata[i] > 1) this.funcdata[i] = 0;
    }
    this.compute();
  };
  
  this.random = function() {
    for (var i = 0; i < this.funcdata.length; i++) {
      if(this.allowDontCare) {
        this.funcdata[i] = Math.floor(Math.random() * 3);
      }else{
        this.funcdata[i] = Math.floor(Math.random() * 2);
      }
    }
    this.compute();
  };
  
  this.clear = function() {
    for (var i = 0; i < this.funcdata.length; i++) {
      this.funcdata[i] = 0;
    }
    this.compute();
  };

  function bitCount(value) {
    var counter = 0;
    while (value > 0) {
      if ((value & 1) === 1) counter++;
      value >>= 1;
    }
    return counter;
  }
  
  this.compute = function() {
    this.primTerms.length = 0;
    this.implicantGroups.length = 0;
    this.minimalTerm = "0";
    this.coloredMinimalTerm = "0";
    this.minimalTermPrims.length = 0;
    this.primTermTables.length = 0;
    this.petrickTermPrims.length = 0;
    
    var counter = 0;
    var lastIg = -1;
    var continueLoop = true;
    while(continueLoop) {
      
      continueLoop = false;
      var ig = new ImplicantGroup();
      
      if(counter === 0) {
         for (var i = 0; i < this.funcdata.length; i++) {
           if(this.funcdata[i] > 0) {
             var impl = new Implicant();
             impl.imp[i] = i;
             impl.isPrim = true;
             ig.group.push(impl);
             continueLoop = true;
           }
         }
      }else{
        
        for (var i = 0; i < lastIg.group.length; i++) {
          for (var j = i+1; j < lastIg.group.length; j++) {
            var imp1 = lastIg.group[i];
            var imp2 = lastIg.group[j];
            
            if (imp1.bitMask === imp2.bitMask) {

              var found = false;
              var xor = -1;
              for (var m in imp1.imp) {
                for (var n in imp2.imp) {
                  var i1 = imp1.imp[m];
                  var i2 = imp2.imp[n];
                  //console.log(i1 + "<->" + i2);
                  xor = (i1 ^ i2) & (~imp1.bitMask);
                  if (bitCount(xor) === 1) {
                    //console.log("found merge candidate" + i1 + "<->" + i2);
                    found = true;
                  }
                  break;
                }
                break;
              }
              if (found) {
                imp1.isPrim = false;
                imp2.isPrim = false;

                var impl = new Implicant();
                impl.isPrim = true;
                impl.bitMask = imp1.bitMask | xor;
                for (var m in imp1.imp)
                  impl.imp[m] = parseInt(m);
                for (var n in imp2.imp)
                  impl.imp[n] = parseInt(n);

                var foundMatch = false; // determine if this combination is already there
                for(var k=0; k < ig.group.length; k++) {
                  var exist = ig.group[k];
                  var isTheSame = true;  
                   for(var m in impl.imp) {
                     var found = false;
                     for (var n in exist.imp) {
                      if(parseInt(m) === parseInt(n)) {
                        found = true;
                      }
                     }
                     if(!found) {
                       isTheSame = false;
                       break;
                     }
                   }
                   if(isTheSame) {
                     foundMatch = true;
                     break;
                   }
                }
                if(!foundMatch) {
                  ig.group.push(impl);
                  continueLoop = true;
                }
              }
            }
          }
        }
      }
      
      if(continueLoop) this.implicantGroups.push(ig);
      lastIg = ig;
      counter++;
    }
    
    // collect primterms
    this.primTerms.length = 0;
    this.minimalTermPrims.length = 0;
    var color = 0.0;
    for(var i= this.implicantGroups.length-1; i >=0; i--) {
      var g = this.implicantGroups[i].group;
    
      for(var j=0; j < g.length; j++) {
        if(g[j].isPrim) {
          
          // prim terms introduced by don't cares
          // must have at least one 1
          var containsOne = false;
          var allFuncPrimTerm = g[j].imp;
          for(var kk in allFuncPrimTerm) {
            var k = allFuncPrimTerm[kk];
            if(this.funcdata[k] === 1) {
              containsOne = true;
            }
          }
          
          if(!containsOne){
            g[j].isOnlyDontCare = true;
          } else {
            var primTerm = new PrimTerm();
            primTerm.implicant = g[j];

            // extract minTerm as string
            for (var thisVal in primTerm.implicant.imp) {
              var minTerm = "";
              var one = 1;
              var needed = (~primTerm.implicant.bitMask);
              for (var v = 0; v < this.noOfVars; v++) {
                if ((needed & one) === one) {
                  if ((thisVal & one) === one) {
                    minTerm = "<i>x</i><sub><small>" + v + "</small></sub>" + minTerm;
                  } else {
                    minTerm = "<i>x&#772;</i><sub><small>" + v + "</small></sub>" + minTerm;
                  }
                }
                one = one << 1;
              }
              minTerm = "(" + minTerm + ")";
              if (primTerm.implicant.bitMask === Math.pow(2, this.noOfVars) - 1)
                minTerm = "1";
              primTerm.color = hsvToRgb(color, 1.0, 0.5);
              color += 0.22;
              color = color % 1.0;


              primTerm.termString = minTerm;
              var colorStr = "rgb(" + primTerm.color[0] + "," + primTerm.color[1] + "," + primTerm.color[2] + ")";
              primTerm.coloredTermString = "<span style='color:" + colorStr + "'>" + minTerm + "</span>";
              break;
            }

            this.primTerms.push(primTerm);
          }
        }
      }
    }
    
    
    // looking for essential prime implicants 
    var remaining = new Object();
    for (var i = 0; i < this.funcdata.length; i++) {
      if(this.funcdata[i] === 1) {
        remaining[i] = i;
      }
    }
    
    this.primTermTables.length = 0;
    var primTableLoop = 0;
    var primTableFound = (this.primTerms.length > 0);
    var cyclicCoveringFound = false;
    var primTermTable;
    while (primTableFound) {

      primTableFound = false;

      primTermTable = new PrimTermTable(primTableLoop);
      for (var r in remaining) {
        primTermTable.remainingVars.push(remaining[r]);
      }

      if (primTableLoop === 0) { 
        for (var j = 0; j < this.primTerms.length; j++) {
          primTermTable.remainingPrimTerms.push(this.primTerms[j]);
        }
      } else {
        // remove rows
        var prevTable = this.primTermTables[primTableLoop-1]; 
        for(var k=0; k <prevTable.remainingPrimTerms.length; k++) {
          if(!prevTable.remainingPrimTerms[k].used){
            
            var superseded = false;
            var impA = prevTable.remainingPrimTerms[k].implicant.imp;
            var varCover = new Object;
            var countA = 0;
            for(var r in remaining) {
              var v = remaining[r];
              if (v in impA) {
                varCover[v] = v;
                countA++;
              }
            }
            
            for (var l = 0; l < prevTable.remainingPrimTerms.length && !superseded; l++) {
              if (!prevTable.remainingPrimTerms[l].used && k !== l) {
                var impB = prevTable.remainingPrimTerms[l].implicant.imp;
                var countB = 0;
                for (var r in varCover) {
                  var v = varCover[r];
                  if (v in impB) {
                    countB++;
                  }
                }
                if(countA === countB) {
                  var countBInRemaining = 0;
                  for (var r in remaining) {
                    var v = remaining[r];
                    if (v in impB) {
                      countBInRemaining++;
                    }
                  }
                  if(countBInRemaining > countA) {
                    superseded = true;
                  }else{
                    if(k > l) {
                      superseded = true;
                    }
                  }
                }

              }
            }
            
            if(!superseded) {
              primTermTable.remainingPrimTerms.push(prevTable.remainingPrimTerms[k]);
            }else{
              prevTable.supersededPrimTerms.push(prevTable.remainingPrimTerms[k]);
            }
          }
        }
      }

      if (primTermTable.remainingPrimTerms.length > 0) {
        this.primTermTables.push(primTermTable);
        var currentTerms = primTermTable.remainingPrimTerms;

        var toBeRemoved = new Object();
        
        for (var r in remaining) {
          var i = remaining[r];
          var count = 0;
          var term = -1;
          for (var j = 0; j < currentTerms.length && count < 2; j++) {
            if (i in currentTerms[j].implicant.imp) {
              term = j;
              count++;
            }
          }

          if (count === 1) {
            currentTerms[term].neededByVar[i] = primTableLoop;
            if(!currentTerms[term].used) {
              this.minimalTermPrims.push(currentTerms[term]);
              currentTerms[term].used = true;
              primTermTable.essentialPrimTerms.push(currentTerms[term]);
              primTableFound = true;

              for (var r in remaining) {
                var ii = remaining[r];
                if (ii in currentTerms[term].implicant.imp) {
                  toBeRemoved[ii] = ii;
                }
              }
            }
          }
        }
        
        // remove columns
        var tmpRemaining = new Object();
        for (var e in remaining){
          var ee = remaining[e];
          tmpRemaining[ee] = ee;
          delete remaining[e];
        }
        var remainingCount = 0;
        for (var r in tmpRemaining) {
          var t = tmpRemaining[r];
          if(!(t in toBeRemoved)) {
             remaining [t] = t;
             remainingCount++;
          }
        }    
      }
      
      if( remainingCount === 0 ) {
        primTableFound = false; // break loop
      }else{
        if(!primTableFound) {
          cyclicCoveringFound = true;
        }
      }

      primTableLoop++;
    }
    
   var solutionFound = true;
    
    // Petrick's Method
    if (cyclicCoveringFound) {
      //console.log("Cyclic covering found");

      var andArray = new Array();
   
      for (var r in remaining) {
        var ii = remaining[r];
         var orArray = new Array();

        for (var k = 0; k < primTermTable.remainingPrimTerms.length; k++) {
          var imp = primTermTable.remainingPrimTerms[k].implicant.imp;
          if(ii in imp){
            var monom = new Object();
            monom[k] = k;
            orArray.push(monom);
          }
        }
        andArray.push(orArray);
      }
      
      solutionFound = this.petrickSolver.solve(andArray);
      
      if (solutionFound) {
        var solutions = this.petrickSolver.solution[0];

        var bestSolution = -1;
        var bestCount = 10000000;
        var bestVarCount = 10000000;
        for (var i = 0; i < solutions.length; i++) {
          var count = 0;
          for (var j in solutions[i]) {
            count++;
          }
          if (count <= bestCount) { // first sort accoring to monom length

            var foundBest = true;
            if (count === bestCount) {
              var bestVarCountNew = 0;
              for (var j in solutions[i]) {
                for (var v in primTermTable.remainingPrimTerms[j].implicant.imp) {
                  bestVarCountNew++;
                }
              }
              if (bestVarCountNew >= bestVarCount)
                foundBest = false;
            }

            if (foundBest) {
              bestCount = count;
              bestSolution = i;
              bestVarCount = 0;
              for (var j in solutions[bestSolution]) {
                for (var v in primTermTable.remainingPrimTerms[j].implicant.imp) {
                  bestVarCount++;
                }
              }
            }
          }
        }
        //console.log("Best solution " + bestSolution);

        var best = solutions[bestSolution];
        for (var b in best) {
          var addPrimTerm = primTermTable.remainingPrimTerms[best[b]];
          this.minimalTermPrims.push(addPrimTerm);
          this.petrickTermPrims.push(addPrimTerm);
        }
      }
    }
    
    if (solutionFound) {
      this.minimalTerm = "";
      this.coloredMinimalTerm = "";
      var firstL = true;
      for (var i = 0; i < this.minimalTermPrims.length; i++) {
        if (!firstL) {
          this.minimalTerm += " &or; ";
          this.coloredMinimalTerm += " &or; ";
        }
        this.minimalTerm += this.minimalTermPrims[i].termString;
        this.coloredMinimalTerm += this.minimalTermPrims[i].coloredTermString;
        firstL = false;
      }

      if (this.minimalTermPrims.length === 0) {
        this.minimalTerm = "0";
        this.coloredMinimalTerm = "0";
      }
    }else{
       this.minimalTerm = 'Error: The cyclic covering problem is too large (increase the "maxProblemSize" parameter)';
       this.coloredMinimalTerm = 'Error: The cyclic covering problem is too large (increase the "maxProblemSize" parameter)';
    }
  };
}




function QuineMcCluskey(parentDivId, columns, language) {
  var myDiv = -1;
  var divId = parentDivId;
  this.cols = columns + 1;
  this.rows = Math.pow(2, columns);
  this.data =  new QuineMcCluskeyDataCtrl();
  var that = this;

  var labels;
  if(language === 0) {
    labels = {ttable:"Truth table",
              minExp:"Minimal boolean expression",
              impli:"Implicants",
              order:"Order",
              primChart:"Prime implicant chart",
              primChartReduced:"Reduced prime implicant chart (Iteration",
              extractedPrims:"Extracted essential prime implicants",
              extractedMPrims:"Extracted prime implicants",
              petricksM:"Petrick's method"};
  }else{
    labels = {ttable:"Wahrheitstafel",
              minExp:"Minimaler boolescher Ausdruck",
              impli:"Implikanten",
              order:"Ordnung",
              primChart:"Primimplikantentafel",
              primChartReduced:"Reduzierte Primimplikantentafel (Iteration",
              extractedPrims:"Extrahierte essentielle Primimplikanten",
              extractedMPrims:"Extrahierte Primimplikanten",
              petricksM:"Verfahren von Petrick"};
    
  }

  this.init = function() {
    
    this.data.init(columns);
    
    myDiv = document.createElement('div');
    if (!myDiv) {
      console.log("QuineMcCluskey error: can not create a canvas element");
      myDiv = -1;
    } else {
     
      var parent = document.getElementById(divId);
      if (!parent) {
        if(divId !== "fakeDivId") {
          console.log("QuineMcCluskey error: can not find an element with the given name: " + divId);
        }
        myDiv = -1;
      } else {
        document.body.appendChild(myDiv);
        parent.appendChild(myDiv);
      }
    }
    this.update();
  };

  this.setNoOfVars = function(vars) {
    var c = parseInt(vars);
    if (c < 1 && c > 6)
      return;
    this.cols = c + 1;
    this.rows = Math.pow(2, c);
    this.data.init(c);
    this.update();
  };

  this.genRandom = function() {
    this.data.random();
    this.update();
  };

  this.allowDontCares = function(type) {
    if(type > 0) {
      this.data.allowDontCare = true;
    }else{
      this.data.allowDontCare = false;
    }
    this.data.clear();
    this.update();
  };

  this.drawImplicantGroup = function(g, parent, primFlag, t, drawPetrickVars) {
    var primTermTable = this.data.primTermTables[t];
    var myTable = document.createElement('table');
    myTable.setAttribute('class', 'qmcTableClass');
    var myRow = document.createElement('tr');
    
    var cell1h = document.createElement('td');  
    cell1h.setAttribute('class', 'qmcTdNoBorder');
    cell1h.innerHTML = "";
    myRow.appendChild(cell1h);
    
    for (var j = 0; j < this.data.noOfVars; j++) {
      var myCell = document.createElement('th');
      myCell.innerHTML = "<i>x</i><sub><small>" + (this.data.noOfVars-1-j) + "</small></sub>";
      myCell.setAttribute('class', 'qmcHeaderX qmcBit');
      myRow.appendChild(myCell);
    }
    
    if (primFlag) {
      for (var i = 0; i < primTermTable.remainingVars.length; i++) {
        var cellImph = document.createElement('td');
        cellImph.setAttribute('class', 'qmcTdNoBorder');
        cellImph.innerHTML = primTermTable.remainingVars[i].toString(10);
        myRow.appendChild(cellImph);
      }
    }
    
    var cellImph = document.createElement('td');
    cellImph.setAttribute('class', 'qmcTdNoBorder');
    cellImph.innerHTML = "";
    myRow.appendChild(cellImph);


    myTable.appendChild(myRow);
    
    var iMax = 0;
    if(!primFlag) iMax = g.group.length; else iMax = primTermTable.remainingPrimTerms.length;
    
    for (var i = 0; i < iMax; i++) {
      var impl = -1;
      if(!primFlag) impl = g.group[i]; else impl = primTermTable.remainingPrimTerms[i].implicant;
      var bits = 0;
      var mask = impl.bitMask;
      
      for(var m in impl.imp) {
        bits = impl.imp[m];
        break;
      }
               
      myRow = document.createElement('tr');
      
      var cell1 = document.createElement('td');      
      var cell1Str = "";
      var first = true;
      for(var m in impl.imp) {
        if(!first) cell1Str +=  ", ";
        cell1Str += impl.imp[m].toString(10);
        first = false;
      }
      cell1.innerHTML = cell1Str + ":";
      cell1.setAttribute('class', 'qmcTdNoBorder');
      myRow.appendChild(cell1);
      
      var res = bits.toString(2);
      for (var j = 0; j < this.data.noOfVars; j++) {
        var myCell = document.createElement('td');
        myCell.setAttribute('class', 'qmcBit');
        var str;

        var currentBit = Math.pow(2, (this.data.noOfVars - 1)-j);
             
        if ((currentBit & mask) === currentBit) {
          str = "-";
          myCell.innerHTML = str;
        } else {
          if (j >= (this.data.noOfVars) - res.length) {
            str = res.charAt(j - (this.data.noOfVars - res.length));
            myCell.innerHTML = str;
          } else {
            str = "0";
            myCell.innerHTML = str;
          }
        }
        myRow.appendChild(myCell);
      }
      
     
      if (!primFlag) {
         var cellLast = document.createElement('td');
         cellLast.setAttribute('class', 'qmcTdNoBorder');
        if (impl.isPrim) {
          cellLast.innerHTML = "&#x2713;";  //equivalent &check; in most browsers
          if(impl.isOnlyDontCare){
            cellLast.innerHTML = " (&times;)"
          }
        } else {
          cellLast.innerHTML = "&rarr;";
        }
        myRow.appendChild(cellLast);
      }else{
        for (var v = 0; v < primTermTable.remainingVars.length; v++) {
          var ii = primTermTable.remainingVars[v];
          var cellUsed = document.createElement('td');
          cellUsed.setAttribute('class', 'qmcPrimItem qmcBit');
          if (ii in impl.imp) {
            cellUsed.innerHTML = "&#9675;";
            if (ii in primTermTable.remainingPrimTerms[i].neededByVar) {
              if(primTermTable.remainingPrimTerms[i].neededByVar[ii] === t) {
                cellUsed.innerHTML = "<span style='color:green;'>&#9679;</span>";
              }
            }
          }

          myRow.appendChild(cellUsed);
        }
         var cellLast = document.createElement('td');
         cellLast.setAttribute('class', 'qmcTdNoBorder');    
         cellLast.innerHTML = primTermTable.remainingPrimTerms[i].coloredTermString;  
         if(drawPetrickVars) {
           var pVars = "&nbsp;&equiv;&nbsp;<i>p</i><sub><small>" + i + "</small></sub>";
           cellLast.innerHTML += pVars;        
         }
         
         
         myRow.appendChild(cellLast);
      }
 
      
      myTable.appendChild(myRow);
    }

    parent.appendChild(myTable);
  };


  this.update = function() {

    if(myDiv === -1) return;

    // clean up
    var oldInnerDiv = document.getElementById(divId+"_innerDiv");
    if (oldInnerDiv) myDiv.removeChild(oldInnerDiv);
    
    var myInnerDiv = document.createElement('div');
    myInnerDiv.setAttribute('id', divId+"_innerDiv");
    

    var myTruthTableDiv = document.createElement('div');
    myTruthTableDiv.innerHTML = "<div>" + labels['ttable'] + ":</div>";
    myTruthTableDiv.setAttribute('class', 'qmcTableLabelDiv');
    
    // re-generate
    var myTable = document.createElement('table');
    myTable.setAttribute('class', 'qmcTableClass');

    var myRow = document.createElement('tr');
    
    var cell1h = document.createElement('td');      
    cell1h.innerHTML = "";
    cell1h.setAttribute('class', 'qmcTdNoBorder');
    myRow.appendChild(cell1h);
    
    for (var j = 0; j < this.cols; j++) {
      var myCell = document.createElement('th');
      if (j < this.cols - 1) {
        myCell.innerHTML = "<i>x</i><sub><small>" + (this.cols-2-j) + "</small></sub>";
        myCell.setAttribute('class', 'qmcHeaderX qmcBit');
      } else {
        myCell.innerHTML = "<i>y</i>";
        myCell.setAttribute('class', 'qmcHeaderY qmcBit');
      }
      myRow.appendChild(myCell);
    }
    myTable.appendChild(myRow);
   

   
    for (var i = 0; i < this.rows; i++) {
      myRow = document.createElement('tr');
      
      var cell1 = document.createElement('td');      
      cell1.innerHTML = i.toString(10) + ":";
      cell1.setAttribute('class', 'qmcTdNoBorder');
      myRow.appendChild(cell1);
      
      var res = i.toString(2);
      for (var j = 0; j < this.cols; j++) {
        var myCell = document.createElement('td');

        if (j < this.cols - 1) { // x element
          myCell.setAttribute('class', 'qmcBit');
          var str;
          if (j >= (this.cols - 1) - res.length) {
            str = res.charAt(j - ((this.cols - 1) - res.length));
            myCell.innerHTML = str;
          } else {
            str = "0";
            myCell.innerHTML = str;
          }
        } else { // y element
          myCell.setAttribute('class', 'qmcBit qmcBitY');
          myCell.setAttribute('title', i);
          myCell.onmousedown = function(event) {
            myCellMouseDown(event);
          };

          if (this.data.funcdata[i] === 0) {
            myCell.innerHTML = "0";
          } 
          if (this.data.funcdata[i] === 1) {
            myCell.innerHTML = "1";
          }
          if (this.data.funcdata[i] === 2) {
            myCell.innerHTML = "&times;";
          }
        }
        myRow.appendChild(myCell);
      }
      myTable.appendChild(myRow);
    }

    myTruthTableDiv.appendChild(myTable);
    myInnerDiv.appendChild(myTruthTableDiv);
    

    for(var i=0; i < this.data.implicantGroups.length; i++) {
      var myImplicantDiv = document.createElement('div');
      myImplicantDiv.innerHTML = "<div>"+ labels['impli'] + " (" + labels['order'] + " "+i+"):</div>";
      myImplicantDiv.setAttribute('class', 'qmcTableLabelDiv');
      this.drawImplicantGroup(this.data.implicantGroups[i],  myImplicantDiv, false, 0, false);
      myInnerDiv.appendChild(myImplicantDiv); 
    }
    
     
    for (var i = 0; i < this.data.primTermTables.length; i++) {
      var resultDiv = document.createElement('div');
      if(i === 0 ) {
        resultDiv.innerHTML = "<p>" + labels['primChart'] + ":</p";
      }else{
        resultDiv.innerHTML = "<p> " +labels['primChartReduced'] + " " + (i-1) + "):</p>";
      }
        
      resultDiv.setAttribute('class', 'qmcTableResultDiv');

      var drawPetrickVars = false;
      if(this.data.petrickTermPrims.length > 0 && i === this.data.primTermTables.length-1) {
        drawPetrickVars = true;
      }
      
      this.drawImplicantGroup(this.data.primTerms, resultDiv, true, i, drawPetrickVars);
      
      var essPTermsDiv = document.createElement('div');
      var essPTermsStr = "";
      var primTermTable = this.data.primTermTables[i];
      var jj = primTermTable.essentialPrimTerms.length;
      for(var j=0; j < jj; j++) {
        essPTermsStr += primTermTable.essentialPrimTerms[j].coloredTermString;
        if(j !== (jj-1)) essPTermsStr += ", ";
      }
      if(jj > 0) {
       essPTermsDiv.innerHTML = "<p>" + labels['extractedPrims'] +": <span class='qmcMathFont'>" + essPTermsStr + "</span></p>";
       essPTermsDiv.setAttribute('class', 'qmcIndent');
       resultDiv.appendChild(essPTermsDiv);
      }
     
      myInnerDiv.appendChild(resultDiv);
    }
    
    if (this.data.petrickTermPrims.length > 0) {
      var petrickDiv = document.createElement('div');
      petrickDiv.innerHTML = "<p> " + labels['petricksM'] + " </p>";

      var petrickInnerDiv = document.createElement('div');
      petrickInnerDiv.innerHTML = "<span class='qmcMathFont'>" + this.data.petrickSolver.log + "</span>";
      petrickInnerDiv.setAttribute('class', 'qmcIndent');
      petrickDiv.appendChild(petrickInnerDiv);

      var petrickEssTermsDiv = document.createElement('div');
      var petrickEssTermsStr = "";
      var jj = this.data.petrickTermPrims.length;
      for (var j = 0; j < jj; j++) {
        petrickEssTermsStr += this.data.petrickTermPrims[j].coloredTermString;
        if (j !== (jj - 1))
          petrickEssTermsStr += ", ";
      }
      if (jj > 0) {
        petrickEssTermsDiv.innerHTML = "<p>" + labels['extractedMPrims'] + " (" + labels['petricksM'] + "): <span class='qmcMathFont'>" + petrickEssTermsStr + "</span></p>";
        petrickEssTermsDiv.setAttribute('class', 'qmcIndent');
        petrickDiv.appendChild(petrickEssTermsDiv);
      }

         myInnerDiv.appendChild(petrickDiv);
    }
    
    
    var termDiv = document.createElement('div');
    termDiv.innerHTML = "<p><strong>" + labels['minExp']+ ":</strong> </p> <p ><span class='qmcMathFont'><i>y</i>&nbsp;=&nbsp;" + this.data.coloredMinimalTerm; +"</span></p>";
    myInnerDiv.appendChild(termDiv);
    myDiv.appendChild(myInnerDiv);
  };

  function myCellMouseDown(e) {

    var targ;
    if (e.target) {
      targ = e.target;
    } else { // deal with Microsoft
      if (e.srcElement)
        targ = e.srcElement;
    }
    if (targ.nodeType === 3) { // deal with Safari
      targ = targ.parentNode;
    }
    var i = parseInt(targ.title);
    that.data.activated(i);

    that.update();
  }
}