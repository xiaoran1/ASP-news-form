using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chessgame_chessboard : System.Web.UI.Page
{
    static List<string> mylist;
    static int numw = 8;
    protected void Page_Load(object sender, EventArgs e)
    {
        mylist = new List<string>();
    }
    protected void boradmaker_Click(object sender, EventArgs e)
    {
        TableCell boardcells;
        TableRow boardrows;
        Table chessboard = new Table();
        chessboard.Attributes.Add("align", "center");
        string rowqueen = "25160374";
        rowqueen =  resultlist.SelectedItem.ToString();
        char[] queenarray = rowqueen.ToCharArray();
        for (int i = 0; i < 8; i++)
        {
            boardrows = new TableRow();
            for (int j = 0; j < 8; j++)
            {
                boardcells = new TableCell();
                if ((i + j) % 2 == 1)
                {
                    boardcells.CssClass = "black_td";
                }
                else
                {
                    boardcells.CssClass = "white_td";
                }
                if (j.ToString() == queenarray[i].ToString())
                {
                    boardcells.CssClass += " queen";
                }
                boardrows.Cells.Add(boardcells);
            }
            chessboard.Rows.Add(boardrows);
        }
        PlaceHolder1.Controls.Add(chessboard);
    }
    protected void generatelist_Click(object sender, EventArgs e)
    {
        resultlist.Items.Clear();
        ListItem boardno = new ListItem();
        int[] numlist = new int[numw+1];
        recursivecheck(0, numlist);
        List<string> finallist = mylist.Distinct().ToList();
        for (int i = 0; i < finallist.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = finallist[i];
            resultlist.Items.Add(li);
        }
        Response.Write("total: " + finallist.Count.ToString());
    }
    private void recursivecheck(int p, int[] x)
    {
        for (x[p] = 0; x[p] < numw; x[p]++)
        {
            if (p < numw)
            {
                recursivecheck(p + 1, x);
            }
            else
            {
                for (x[p] = 0; x[p] < numw; x[p]++)
                {
                    Boolean pass = true;
                    for (int r = 0; r < numw; r++)
                    {
                        if (pass == false) { break; }
                        for (int c = r + 1; c < numw; c++)
                        {
                            if (x[r] == x[c] || Math.Abs(x[r] - x[c]) == c - r)
                            {
                                pass = false;
                                break;
                            }
                        }
                    }
                    if (pass == true)
                    {
                        string li = "";
                        for (int i = 0; i < numw; i++)
                        {
                            li += x[i].ToString();
                        }
                        mylist.Add(li);
                    }
                }
            }
        }
    }
}